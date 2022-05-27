class CodeWriter():

    def __init__(self, outputFilePath, file, doBootstrap):
        # open output file for writing (the file is connected to the object as a field)
        self.file = open(outputFilePath, 'w')
        self.SP = 256  # set the initial stack-pointer address
        # # assembly commands to set SP to 256 initially (SP is register 0 in RAM)
        # self.file.write("@256\n")  # set A-register to 256
        # self.file.write("D=A\n")   # set D-register to A-register
        # self.file.write("@SP\n")   # set A-register to 0
        # # set SP-register (ie. register 0) to D-register
        # self.file.write("M=D\n")
        self.root = outputFilePath[:-4].split('/')[-1]

        self.labelNumber = 0

        self.arithmeticOperationCount = {
            'eq': {'count': 0}, 'lt': {'count': 0}, 'gt': {'count': 0}}

        self.jumpDirectives = {'lt': 'JGE', 'eq': 'JNE', 'gt': 'JLE'}

        self.returnAddressCount = 0

        if doBootstrap:
            self.writeInit()

    
    def writeLabel(self, label):
        """ injects label into assembly stream 

        Args:
            label (str): label name to be written
        """
        self.writeComment("label")
        self.file.write(f"({str(label)})\n")

    def writeGoto(self, label):
        """ effects unconditional goto operation, causing execution to continue from the location marked by the label

        Args:
            label (str): label to go to
        """
        self.writeComment("goto")
        self.file.write(
            f"@{str(label)}\n" +
            "0;JMP\n")

    def writeIf(self, label):
        """effects conditional goto operation. stack's topmost value is popped, 
        if val is not zero, execution continues from the location marked by the label, 
        otherwise execution continues from the next command in the program

        Args:
            label (str): label to go to if condition is met
        """
        self.writeComment("if")
        self.decSP()
        self.file.write(
            f"@{str(label)}\n" +
            "D;JNE\n")

    def loadValInD(self, value):
        """loads the specified value in the d register

        Args:
            value (int): value to load in register
        """
        self.file.write(
            # select constant
            f"@{value}\n" +
            # load constant to D
            "D=A\n")

    def putDOnTopOfStack(self):
        """ helper method that puts the value in the d register on top of the stack
        """
        self.file.write(
            # load sp
            "@SP\n" +
            # get address
            "A=M\n" +
            # put constant
            "M=D\n")

    def incSP(self):
        """ helper method to increase SP by 1
        """
        self.file.write(
            # select sp
            "@SP\n" +
            # increase by 1
            "M=M+1\n")

    def decSP(self):
        """ decreases SP by 1 
        """
        # select sp
        self.file.write(
            "@SP\n" +
            # dec sp
            "AM=M-1\n"
        )

    def putTopValInD(self):
        """ helper method to put the top stack value in the d register
        """
        self.decSP()
        self.file.write(
            # put val in D
            "D=M\n"
        )

    def writeComment(self, comment):
        """ inject a comment into assembly stream to facilitate debugging

        Args:
            comment (str): comment to be injected
        """
        self.file.write(f"//{comment}\n")

    def getCurInstruction(self, curInstruction):
        """method for debugging that comments the vm code

        Args:
            curInstruction (str): vm code
        """
        self.writeComment("vm: " + curInstruction)

    def writePushPop(self, commandType, segment, index=0):
        """
        Writes a push or pop command.

        Parameters:
        commandType: Should be one of two possible string values ('C_PUSH' or 'C_POP')
        segment: A string representing the segment of RAM ('constant','temp','local','argument','this','that','R13','R14','R15')
        index: A string index measured from the base-address of the segment

        NOTE: Code will be expanded in steps
        """

        if commandType == 'C_PUSH':
            if segment == 'constant':
                self.writeComment("push constant")
                self.loadValInD(index)
                self.putDOnTopOfStack()
                self.incSP()
            elif segment in ['R13', 'R14', 'R15']:
                self.file.write(
                    f"@{segment}\n" +
                    "D=M\n")
                self.incSP()
                self.file.write(
                    "A=M-1\n" +
                    "M=D\n")
            elif segment == "static":
                self.writeComment("static push")
                self.file.write(
                    f"@{self.root}.{index}\n" +
                    "D=M\n")
                self.putDOnTopOfStack()
                self.incSP()
            elif segment in ["this", "that"]:
                self.writeComment(f"{segment} push")
                self.file.write(
                    # load index
                    f"@{index}\n" +
                    # set d to index
                    "D=A\n"
                    # load this/that
                    f"@{segment.upper()}\n" +
                    # set
                    "A=M+D\n" +
                    "D=M\n")
                self.putDOnTopOfStack()
                self.incSP()
                self.writeComment("that push done")
            elif segment == "argument":
                self.writeComment("argument push")
                self.loadValInD(index)
                self.file.write(
                    # select arg
                    "@ARG\n" +
                    "A=M+D\n" +
                    "D=M\n")
                self.putDOnTopOfStack()
                self.incSP()
            elif segment == "local":
                self.writeComment("local push")
                self.loadValInD(index)
                self.file.write("@LCL\n"+"A=M+D\n"+"D=M\n")
                self.putDOnTopOfStack()
                self.incSP()
            elif segment == "temp":
                self.writeComment("temp push")
                self.loadValInD(index)
                self.file.write(
                    "@5\n" +
                    "A=A+D\n" +
                    "D=M\n")
                self.putDOnTopOfStack()
                self.incSP()
            elif segment == "pointer":
                self.writeComment("pointer push")
                self.loadValInD(index)
                self.file.write(
                    "@3\n" +
                    "A=A+D\n" +
                    "D=M\n")
                self.putDOnTopOfStack()
                self.incSP()
            self.SP += 1  # increment SP by 1 at the end of a PUSH

        else:
            if segment in ['R13', 'R14', 'R15']:
                self.putTopValInD()
                self.file.write(
                    f"@{segment}\n" +
                    "M=D\n")
            if segment == "static":
                self.writeComment("static pop")
                self.putTopValInD()
                self.file.write(
                    f"@{self.root}.{index}\n" +
                    "M=D\n")
            elif segment in ["this", "that"]:
                self.writeComment(f"{segment} pop")
                self.file.write(
                    f"@{index}\n" +
                    "D=A\n" +
                    f"@{segment.upper()}\n" +
                    "D=M+D\n" +
                    "@R13\n" +
                    "M=D\n")
                self.putTopValInD()
                self.file.write(
                    "@R13\n" +
                    "A=M\n" +
                    "M=D")

            elif segment == "that":
                self.file.write(f"//that pop\n@{index}\nD=A\n@THAT\n")

            elif segment == "argument":
                self.writeComment("argument pop")
                self.file.write(
                    f"@{index}\n" +
                    "D=A\n" +
                    "@ARG\n" +
                    "D=M+D\n" +
                    "@R13\n" +
                    "M=D\n")
                self.putTopValInD()
                self.file.write(
                    "@R13\n" +
                    "A=M\n" +
                    "M=D")
            elif segment == "local":
                self.writeComment("local pop")
                self.file.write(
                    f"@{index}\n" +
                    'D=A\n' +
                    '@LCL\n' +
                    'A=M\n' +
                    'D=D+A\n' +
                    '@LCL\n' +
                    'M=D\n' +
                    '@SP\n' +
                    'M=M-1\n' +
                    'A=M\n' +
                    'D=M\n' +
                    '@LCL\n' +
                    'A=M\n' +
                    'M=D\n' +
                    f'@{index}\n' +
                    'D=A\n' +
                    '@LCL\n' +
                    'A=M\n' +
                    'D=A-D\n' +
                    '@LCL\n' +
                    'M=D\n')

            elif segment == "pointer":
                self.writeComment("pointer pop")
                self.file.write(
                    f"@{index}\n" +
                    "D=A\n" +
                    "@3\n" +
                    "D=A+D\n" +
                    "@R13\n" +
                    "M=D\n")
                self.putTopValInD()
                self.file.write(
                    "@R13\n" +
                    "A=M\n" +
                    "M=D\n")
            elif segment == "temp":
                self.writeComment("temp pop")
                self.file.write(
                    f"@{index}\n" +
                    "D=A\n" +
                    "@5\n" +
                    "D=A+D\n" +
                    "@R13\n" +
                    "M=D\n")
                self.putTopValInD()
                self.file.write(
                    "@R13\n" +
                    "A=M\n" +
                    "M=D\n")

            self.SP -= 1  # decrement SP by 1 at the end of a POP
        return

    def writeArithmeticComparison(self, operation):
        """"compare the top two stack values based on the given arithmetic comparison operation 

        Args:
            operation (str): arithmetic operation to be performed
        """
        # generate label name
        counter = self.arithmeticOperationCount[operation]
        counter['count'] += 1
        labelName = f"{operation.upper()}{counter['count']}"

        # get the appropriate jump directive
        jumpDirective = self.jumpDirectives[operation]

        # start writing instructions
        self.writeComment(f"{jumpDirective}")
        self.decSP()
        # set D to top of stack
        self.file.write('D=M\n')
        self.decSP()
        self.file.write(
            # set D to x-y
            'D=M-D\n' +
            # load false label
            f'@NOT_{labelName}\n' +
            # jump to false section on directive
            f'D;{jumpDirective}\n' +
            # load stack pointer
            '@SP\n' +
            # set A to top of stack address
            'A=M\n' +
            # set it to -1 for true
            'M=-1\n' +
            # load inc stack pointer
            f'@INC_SP_{labelName}\n' +
            # jump unconditionally
            '0;JMP\n' +
            # not true section
            f'(NOT_{labelName})\n' +
            # load stack pointer
            '@SP\n' +
            # set A to to top of stack address
            'A=M\n' +
            # set to 0 for false
            'M=0\n' +
            # define inc stack pointer label
            f'(INC_SP_{labelName})\n')
        self.incSP()

    def getArithmeticInstruction(self, comment, unary=False):
        """
        Performs an arithmetic or logical operation

        Parameter:
        operation: a string specifying the operation to be performed ('add','sub','neg','and','or','not','eq','gt','lt')
        """
        arithmeticInstructionDict = {
            "add": "M+D", "sub": "M-D", "and": "M&D", "or": "M|D", "not": "!M", "neg": "-M"}

        if unary:
            self.writeComment(comment)
            self.decSP()
            self.file.write(f"M={arithmeticInstructionDict[comment]}\n")
            self.incSP()
        else:
            self.writeComment(comment)
            self.decSP()
            self.file.write("D=M\n")
            self.decSP()
            self.file.write(f"M={arithmeticInstructionDict[comment]}\n")
            self.incSP()

    def writeArithmetic(self, operation):
        """ directs program to appropriate method depending on which operation is prescribed

        Args:
            operation (str): operation to be performed
        """
        if operation == "not" or operation == "neg":
            self.getArithmeticInstruction(operation, True)
        elif operation in ['lt', 'eq', 'gt']:
            self.writeArithmeticComparison(operation)
        else:
            self.getArithmeticInstruction(operation)

    def writeCall(self, fName, nArgs):
        """writes assembly code that effects the call command

        Args:
            fName (str): name of function to be called
            nArgs (int): number of arguments for the function
        """
        self.returnAddressCount += 1
        self.writeComment("call")
        # push return address
        self.loadValInD(f"RET_ADDRESS.{str(self.returnAddressCount)}")
        self.putDOnTopOfStack()
        self.incSP()
        # push lcl, arg, this, that to stack
        self.writePushPop('C_PUSH', 'local')
        self.writePushPop('C_PUSH', 'argument')
        self.writePushPop('C_PUSH', 'this')
        self.writePushPop('C_PUSH', 'that')
        # reposition arg ARG = SP-5-n
        self.file.write(
            "@SP\n" +
            # get val of sp
            'D=M\n' +
            # SP-=nArgs
            f'@{nArgs}\n' +
            'D=D-A\n' +
            # SP-=5
            '@5\n' +
            'D=D-A\n' +
            # set arg to that
            '@ARG\n' +
            'M=D\n' +
            # LCL = SP
            '@SP\n' +
            'D=M\n' +
            '@LCL\n' +
            'M=D\n')
        self.writeGoto(fName)
        # inject retAddress label to stream
        self.file.write(f'(RET_ADDRESS.{self.returnAddressCount})\n')

    def writeFunction(self, functionName, nVars):
        """writes assembly code that effects the function command

        Args:
            functionName (str): name of function
            nVars (int): number of arguments for the function
        """
        self.file.write(f"({functionName})")
        for i in range(int(nVars)):
            self.writePushPop("C_PUSH", "constant", 0)

    def restoreSegment(self, segment, difference):
        """performs {SEGMENT} = *(frame - difference)

        Args:
            segment (str): THAT, THIS, ARG, LCL
            difference (int): number to subtract from frame address
        """
        self.file.write(
            # load difference from frame
            f"@{difference}\n" +
            # place in D
            "D=A\n" +
            # load frame
            "@R13\n" +
            # put address val in A
            "A=M-D\n" +
            # get the value at the memory address being pointed to
            "D=M\n" +
            # load LCL
            f"@{segment}\n" +
            # RAM[that] becomes D
            "M=D\n"
        )

    def writeReturn(self):
        """writes assembly code that effects return command
        """
        self.file.write(
            "//return\n" +
            # frame = LCL
            "@LCL\n" +
            # frame in d
            "D=M\n" +
            # temp reg
            "@R13\n" +
            # put frame into that temp reg
            "M=D\n" +
            # retAddress = *(frame – 5) -- we are subtracting 5 so load that
            "@5\n" +
            # put 5 in D
            "D=A\n" +
            # load frame from the earlier temp var earlier
            "@R13\n" +
            # put the difference into temp reg
            "A=M-D\n" +
            # get val at that address in memory (pointing)
            "D=M\n" +
            # load to temp var
            "@R14\n" +
            # load to temp var step 2
            "M=D\n")
        # *ARG = pop()
        self.putTopValInD() 
        self.file.write(
            # set top of arg stack to return val for caller
            "@ARG\n" +
            # get reg access at mem address
            "A=M\n" +
            # set to d, top stack val
            "M=D\n" +
            # SP = ARG +1 --- restores sp
            "@ARG\n" +
            # store arg+1 address in d
            "D=M+1\n" +
            # load sp
            "@SP\n" +
            # set address to arg+1
            "M=D\n")
        # THAT = *(frame-1)
        self.restoreSegment("THAT", 1)
        # THAT = *(frame-2)
        self.restoreSegment("THIS", 2)
        # ARG = *(frame-3)
        self.restoreSegment("ARG", 3)
        # LCL = *(frame-4)
        self.restoreSegment("LCL", 4)
        self.file.write(
            # goto retAddress
            # load retAddress
            "@R14\n" +
            "A=M\n" +
            # jump unconditionally to ret address
            "0;JMP\n")

    def writeInit(self):
        """sets SP to 0 and calls sys.init
        """
        self.writeComment("init")
        self.file.write('@256\n')
        self.file.write('D=A\n')
        self.file.write('@SP\n')
        self.file.write('M=D\n')
        self.writeCall('Sys.init', 0)      # call Sys.init

    def infiniteLoop(self):
        """
         Writes an infinite loop for the end of asm programs
         """
        self.file.write("(INFINITE_LOOP)\n")
        self.file.write("@INFINITE_LOOP\n")
        self.file.write("0;JMP\n")
