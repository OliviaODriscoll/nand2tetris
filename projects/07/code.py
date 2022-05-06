class CodeWriter():

    def __init__(self, outputFilePath,file,doBootstrap):
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

        self.callCount = 0

        if doBootstrap:
            self.writeInit()

    def writeLabel(self, label):
        self.file.write(f"//label\n ({str(label).upper()})\n")

    def writeGoto(self, label):
        self.file.write(f"//goto\n @{str(label).upper()}\n 0;JMP\n")

    def writeIf(self, label):
        self.file.write(
            f'//if\n @SP\n AM=M-1\n @{str(label).upper()}\n D;JNE\n')

    def writePushPop(self, commandType, segment, index=0):
        """
        Writes a push or pop command.

        Parameters:
        commandType: Should be one of two possible string values ('C_PUSH' or 'C_POP')
        segment: A string representing the segment of RAM ('constant','temp','local','argument','this','that','R13','R14','R15')
        index: A string index measured from the base-address of the segment

        NOTE: Code will be expanded in steps
        """

        assemblyPushEnding = "A=M+D\n D=M\n @SP\n A=M\n M=D\n @SP\n M=M+1\n"
        assemblyPopEnding = "D=M+D\n @R13\n M=D\n @SP\n AM=M-1\n D=M\n @R13\n A=M\n M=D\n"
        if commandType == 'C_PUSH':
            if segment == 'constant':
                self.file.write(
                    f"//push constant\n @{index} \nD=A \n@SP \nA=M \nM=D \n@SP \nM=M+1\n")
            elif segment in ['R13', 'R14', 'R15']:
                self.file.write(
                    f"@{segment}\n D=M\n @SP\n M=M+1\n A=M-1\n M=D")
            elif segment == "static":
                self.file.write(
                    f"//static push\n @{self.root}.{index}\n D=M\n @SP\n A=M\n M=D\n @SP\n M=M+1\n")
            elif segment in ["this", "that"]:
                self.file.write(
                    f"//{segment} push\n @{index}\n D=A\n @{segment.upper()}\n {assemblyPushEnding}")
            elif segment == "argument":
                self.file.write(
                    f"//argument push\n @{index}\n D=A\n @ARG\n {assemblyPushEnding}")
            elif segment == "local":
                self.file.write(
                    f"//local push\n @{index}\n D=A\n @LCL\n {assemblyPushEnding}")
            elif segment == "temp":
                self.file.write(
                    f"//temp push\n @{index}\n D=A\n @5\n {assemblyPushEnding}")
            elif segment == "pointer":
                self.file.write(
                    f"//pointer push\n @{index}\n D=A\n @3\n A=A+D\n D=M\n @SP\n A=M\n M=D\n @SP\n M=M+1\n")
            self.SP += 1  # increment SP by 1 at the end of a PUSH

        else:
            if segment in ['R13', 'R14', 'R15']:
                self.file.write(f"@SP\n @AM=M-1\n D=M\n @{segment}\n M=D\n")
            if segment == "static":
                self.file.write(
                    f"//static pop\n @SP\n AM=M-1\n D=M\n @{self.root}.{index}\n M=D\n")
            elif segment in ["this", "that"]:
                self.file.write(
                    f"//{segment} pop\n @{index}\n D=A\n @{segment.upper()}\n {assemblyPopEnding}")
            elif segment == "that":
                self.file.write(f"//that pop\n @{index}\n D=A\n @THAT\n")

            elif segment == "argument":
                self.file.write(
                    f"//argument pop\n @{index}\n D=A\n @ARG\n {assemblyPopEnding}")
            elif segment == "local":
                self.file.write(
                    f"//local pop\n @{index}\n D=A\n @LCL\n {assemblyPopEnding}")
            elif segment == "pointer":
                self.file.write(
                    f"//pointer pop\n @{index}\n D=A\n @3\n D=A+D\n @R13\n M=D\n @SP\n AM=M-1\n D=M\n @R13\n A=M\n M=D\n")
            elif segment == "temp":
                self.file.write(
                    f"//temp pop\n @{index}\n D=A\n @5\n D=A+D\n @R13\n M=D\n @SP\n AM=M-1\n D=M\n @R13\n A=M\n M=D\n")

            self.SP -= 1  # decrement SP by 1 at the end of a POP
        return

    def arithmeticStarting2(self, labelName, jumpDirective):
        return(  # load stack pointer
            f'//{jumpDirective}\n' +
            '@SP\n' +
            # decrement stack pointer and set address
            'AM=M-1\n' +
            # set D to top of stack
            'D=M\n' +
            # load stack pointer
            '@SP\n' +
            # decrement stack pointer and set address
            'AM=M-1\n' +
            # set D to x-y
            'D=M-D\n' +
            # load not true label
            f'@NOT_{labelName}\n' +
            # jump to not true section on directive
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
            f'(INC_STACK_POINTER_{labelName})\n' +
            # load stack pointer
            '@SP\n' +
            # increment stack pointer
            'M=M+1\n')

    def writeArithmetic(self, operation):
        """
        Performs an arithmetic or logical operation

        Parameter:
        operation: a string specifying the operation to be performed ('add','sub','neg','and','or','not','eq','gt','lt')
        """

        arithmeticStarting1 = "@SP\n AM=M-1\n D=M\n @SP\n AM=M-1\n"
        arithmeticStarting2 = "@SP\n AM=M-1\n"
        arithmeticEnding = "@SP\n M=M+1\n"

        if operation == "add":
            self.file.write(
                f"//add\n {arithmeticStarting1} M=M+D\n {arithmeticEnding}")
        elif operation == "sub":
            self.file.write(
                f"//sub\n {arithmeticStarting1} M=M-D\n {arithmeticEnding}")
        elif operation == "and":
            self.file.write(
                f"//and\n {arithmeticStarting1} M=M&D\n {arithmeticEnding}")
        elif operation == "or":
            self.file.write(
                f"//or\n {arithmeticStarting1} M=M|D\n {arithmeticEnding}")

        elif operation == "not":
            self.file.write(
                f"//not\n {arithmeticStarting2} M=!M\n {arithmeticEnding}")
        elif operation == "neg":
            self.file.write(
                f"//neg\n {arithmeticStarting2} M=-M\n {arithmeticEnding}")

        elif operation in ['lt', 'eq', 'gt']:

            counter = self.arithmeticOperationCount[operation]
            counter['count'] += 1
            labelName = f"{operation.upper()}{counter['count']}"

            if operation == "lt":
                self.file.write(
                    f"{self.arithmeticStarting2(labelName,'JGE')}")
            elif operation == "eq":
                self.file.write(
                    f"{self.arithmeticStarting2(labelName,'JNE')}")
            elif operation == "gt":
                self.file.write(
                    f"{self.arithmeticStarting2(labelName,'JLE')}")

    def writeCall(self,fName, nArgs):
        self.callCount+=1
        self.file.write(
            f'@RET_ADDRESS.{str(self.callCount)}\n'+
            'D=A\n'+
            '@SP\n'+
            'A=M\n'+
            'M=D\n'+
            '@SP\n'+
            'M=M+1\n')
        self.writePushPop('C_PUSH','local')
        self.writePushPop('C_PUSH','argument')
        self.writePushPop('C_PUSH','this')
        self.writePushPop('C_PUSH','that')
        self.file.write('@SP\n'+
            'D=M\n'+
            f'@{nArgs}\n'+
            'D=D-A\n'+
            '@5\n'+
            'D=D-A\n'+
            '@ARG\n'+
            'M=D\n'+
            '@SP\n'+
            'D=M\n'+
            '@LCL\n'+
            'M=D\n'+
            f'@{fName}\n'+
            '0;JMP\n'+
            f'(RET_ADDRESS.{self.callCount})\n')


    def writeFunction(self, functionName, nVars):
        self.file.write(f"({functionName})")
        for i in range(int(nVars)):
            self.writePushPop("C_PUSH", "constant", 0)

    def writeReturn(self):
        self.file.write(
"""
//return
@LCL 
D=M 
@FRAME 
M=D 
@5 
D=A 
@FRAME 
A=M-D 
D=M 
@RETURN 
M=D 
@SP 
A=M-1 
D=M 
@ARG 
A=M 
M=D 
@ARG 
D=M+1 
@SP 
M=D 
@1 
D=A 
@FRAME 
A=M-D 
D=M 
@THAT 
M=D 
@2 
D=A 
@FRAME 
A=M-D 
D=M 
@THIS 
M=D 
@3 
D=A 
@FRAME 
A=M-D 
D=M 
@ARG 
M=D 
@4 
D=A 
@FRAME 
A=M-D 
D=M 
@LCL 
M=D 
@RETURN 
A=M 
0;JMP\n""")

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
