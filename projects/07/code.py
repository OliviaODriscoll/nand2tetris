class CodeWriter():

    def __init__(self, outputFilePath, file, doBootstrap):
        # open output file for writing (the file is connected to the object as a field)
        self.file = open(outputFilePath, 'w')
        self.SP = 256  # set the initial stack-pointer address
        # assembly commands to set SP to 256 initially (SP is register 0 in RAM)
        self.file.write("@256\n")  # set A-register to 256
        self.file.write("D=A\n")   # set D-register to A-register
        self.file.write("@SP\n")   # set A-register to 0
        # set SP-register (ie. register 0) to D-register
        self.file.write("M=D\n")
        self.root = outputFilePath[:-4].split('/')[-1]

        self.labelNumber = 0

        self.arithmeticOperationCount = {
            'eq': {'count': 0}, 'lt': {'count': 0}, 'gt': {'count': 0}}
        
        self.jumpDirectives = {'lt':'JGE', 'eq':'JNE','gt':'JLE'}

        self.callCount = 0

        if doBootstrap:
            self.writeInit()

    def writeLabel(self, label):
        self.writeComment("label")
        self.file.write(f"({str(label).upper()})\n")

    def writeGoto(self, label):
        self.writeComment("goto")
        self.file.write(
            f"@{str(label).upper()}\n"+
            "0;JMP\n")

    def writeIf(self, label):
        self.writeComment("if")
        self.decSP()
        self.file.write(
            f"@{str(label).upper()}\n"+
            "D;JNE\n")

    def loadValInD(self, value):
        self.file.write(
            # select constant
            f"@{value}\n" +
            # load constant to D
            "D=A\n")

    def putDOnTopOfStack(self):
        self.file.write(
            # load sp
            "@SP\n" +
            # get address
            "A=M\n" +
            # put constant
            "M=D\n")

    def incSP(self):
        self.file.write(
            # select sp
            "@SP\n" +
            # increase by 1
            "M=M+1\n")
    
    def decSP(self):
        #select sp
        self.file.write(
            "@SP\n"+
            # dec sp
            "AM=M-1\n"
        )

    
    def putTopValInD(self):
        self.file.write(
            # load sp
            "@SP\n"+
            # dec sp
            "AM=M-1\n"+
            #put val in D
            "D=M\n"
        )

    def writeComment(self, comment):
        self.file.write(f"//{comment}\n")

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
                self.file.write("@LCL\n A=M+D\n D=M\n")
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
                self.putDOnTopOfStack
                self.incSP()
            self.SP += 1  # increment SP by 1 at the end of a PUSH

        else:
            if segment in ['R13', 'R14', 'R15']:
                self.putTopValInD()
                self.file.write(
                    f"@{segment}\n"+
                    "M=D\n")
            if segment == "static":
                self.writeComment("static pop")
                self.putTopValInD()
                self.file.write(
                    f"@{self.root}.{index}\n"+
                    "M=D\n")
            elif segment in ["this", "that"]:
                self.writeComment(f"{segment} pop")
                self.file.write(
                    f"@{index}\n"+
                    "D=A\n"+
                    f"@{segment.upper()}\n"+
                    "D=M+D\n"+
                    "@R13\n"+
                    "M=D\n")
                self.putTopValInD()
                self.file.write(
                    "@R13\n"+
                    "A=M\n"+
                    "M=D")

            elif segment == "that":
                self.file.write(f"//that pop\n @{index}\n D=A\n @THAT\n")

            elif segment == "argument":
                self.writeComment("argument pop")
                self.file.write(
                    f"@{index}\n"+
                    "D=A\n"+
                    "@ARG\n"+
                    "D=M+D\n"+
                    "@R13\n"+
                    "M=D\n")
                self.putTopValInD()
                self.file.write(
                    "@R13\n"+
                    "A=M\n"+
                    "M=D")
            elif segment == "local":
                self.writeComment("local pop")
                self.file.write(
                    f"@{index}\n"+
                    "D=A\n"+
                    "@LCL\n"+
                    "D=M+D\n"+
                    "@R13\n"+
                    "M=D\n")
                self.putTopValInD()
                self.file.write(
                    "@R13\n"+
                    "A=M\n"+
                    "M=D")
            elif segment == "pointer":
                self.writeComment("pointer pop")
                self.file.write(
                    f"@{index}\n"+
                    "D=A\n"+
                    "@3\n"+
                    "D=A+D\n"+
                    "@R13\n"+
                    "M=D\n")
                self.putTopValInD
                self.file.write(
                    "@R13\n"+
                    "A=M\n"+
                    "M=D\n")
            elif segment == "temp":
                self.writeComment("temp pop")
                self.file.write(
                    f"@{index}\n"+
                    "D=A\n"+
                    "@5\n"+
                    "D=A+D\n"+
                    "@R13\n"+
                    "M=D\n")
                self.putTopValInD()
                self.file.write(
                    "@R13\n"+
                    "A=M\n"+
                    "M=D\n")

            self.SP -= 1  # decrement SP by 1 at the end of a POP
        return

    def writeArithmeticComparison(self, operation):
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
            f'@INC_STACK_POINTER_{labelName}\n' +
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
            f'(INC_STACK_POINTER_{labelName})\n')
        self.incSP()
    
    def writeArithmetic(self, comment, operation, unary=False):
        """
        Performs an arithmetic or logical operation

        Parameter:
        operation: a string specifying the operation to be performed ('add','sub','neg','and','or','not','eq','gt','lt')
        """
        if unary:
            self.writeComment(comment)
            self.decSP()
            self.file.write(f"M={operation}\n")
            self.incSP()
        else:
            self.writeComment(comment)
            self.decSP()
            self.file.write("D=M\n")
            self.decSP()
            self.file.write(f"M={operation}\n")
            self.incSP()
    
    def getArithmeticInstruction(self,operation):
        if operation == "add":
            self.writeArithmetic(operation,"M+D")
        elif operation == "sub":
            self.writeArithmetic(operation,"M-D")
        elif operation == "and":
            self.writeArithmetic(operation,"M&D")
        elif operation == "or":
            self.writeArithmetic(operation,"M|D")
        elif operation == "not":
            self.writeArithmetic(operation,"!M", True)
        elif operation == "neg":
            self.writeArithmetic(operation, "-M", True)
        elif operation in ['lt','eq','gt']:
            self.writeArithmeticComparison(operation)

   
    def writeCall(self, fName, nArgs):
        self.callCount += 1
        self.file.write(
            # put label for return address
            f'@RET_ADDRESS.{str(self.callCount)}\n' +
            # get address val
            'D=A\n' +
            # load sp
            '@SP\n' +
            # load address
            'A=M\n' +
            # set val at address to d, return address
            'M=D\n' +
            # load sp
            '@SP\n' +
            # inc sp
            'M=M+1\n')
        # push lcl, arg, this, that to stack
        self.writePushPop('C_PUSH', 'local')
        self.writePushPop('C_PUSH', 'argument')
        self.writePushPop('C_PUSH', 'this')
        self.writePushPop('C_PUSH', 'that')
        self.file.write(
            # load sp
            '@SP\n' +
            # get val of sp
            'D=M\n' +
            # subtract num of arguments from sp
            f'@{nArgs}\n' +
            'D=D-A\n' +
            # subtract 5 from sp
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
        self.file.write(f'(RET_ADDRESS.{self.callCount})\n')

    def writeFunction(self, functionName, nVars):
        self.file.write(f"({functionName})")
        for i in range(int(nVars)):
            self.writePushPop("C_PUSH", "constant", 0)

    def returnRepeatedCode(self, memorySection, number):
        self.file.write(
            # load delta before frame end
            f"@{number}\n" +
            # place in D
            "D=A\n" +
            # load frame
            "@R13\n" +
            # get address value into A
            "A=M-D\n" +
            # dereference to get value at mem address
            "D=M\n" +
            # load LCL
            f"@{memorySection}\n" +
            # set value at THAT to D
            "M=D\n"
        )

    def writeReturn(self):
        self.file.write(
            "//return\n" +
            # frame = LCL (frame is temp var)
            "@LCL\n" +
            # store frame in d
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
            "M=D\n" +
            # *ARG = pop()
            # pop stack
            "@SP\n" +
            # dec addresses & sp
            "A=M-1\n" +
            # store tap stack val in D
            "D=M\n" +
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
        self.returnRepeatedCode("THAT", 1)
        self.returnRepeatedCode("THIS", 2)
        self.returnRepeatedCode("ARG", 3)
        self.returnRepeatedCode("LCL", 4)
        self.file.write(
            # goto retAddress
            # load retAddress
            "@R14\n" +
            "A=M\n" +
            # jump unconditionally to ret address
            "0;JMP\n")

    def writeInit(self):
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
