from re import L


class CodeWriter():

	def __init__(self,path):
		self.file = open(path,'w') # open output file for writing (the file is connected to the object as a field)
		self.SP = 256 # set the initial stack-pointer address
		# assembly commands to set SP to 256 initially (SP is register 0 in RAM)
		self.file.write("@256\n")  # set A-register to 256
		self.file.write("D=A\n")   # set D-register to A-register
		self.file.write("@SP\n")   # set A-register to 0
		self.file.write("M=D\n")   # set SP-register (ie. register 0) to D-register

		self.arithmeticOperationCount = {'eq' : { 'count': 0 },'lt' : { 'count': 0 }, 'gt' : { 'count': 0 }}

	def writePushPop(self,commandType,segment,index=0):
		"""
		Writes a push or pop command.

		Parameters:
		commandType: Should be one of two possible string values ('C_PUSH' or 'C_POP')
		segment: A string representing the segment of RAM ('constant','temp','local','argument','this','that','R13','R14','R15')
		index: A string index measured from the base-address of the segment

		NOTE: Code will be expanded in steps
		"""
		if commandType=='C_PUSH':
			if segment == 'constant':
				self.file.write(f"//push constant\n @{index} \nD=A \n@SP \nA=M \nM=D \n@SP \nM=M+1\n")
			elif segment in ['R13','R14','R15']:
				self.file.write(f"@{segment}\n D=M\n @SP\n M=M+1\n A=M-1\n M=D")		
			self.SP+=1 # increment SP by 1 at the end of a PUSH

		else:				
			if segment in ['R13','R14','R15']:
				self.file.write(f"@SP\n @AM=M-1\n D=M\n @{segment}\n M=D\n")
				
			self.SP-=1 # decrement SP by 1 at the end of a POP
		return

	def arithmeticStarting2(self,labelName,jumpDirective):
		return(# load stack pointer
			f'//{jumpDirective}\n' +
            '@SP\n'+
            # decrement stack pointer and set address
            'AM=M-1\n'+
            # set D to top of stack
            'D=M\n'+
            # load stack pointer
            '@SP\n'+
            # decrement stack pointer and set address
            'AM=M-1\n'+
            # set D to x-y
            'D=M-D\n'+
            # load not true label
            f'@NOT_{labelName}\n'+
            # jump to not true section on directive
            f'D;{jumpDirective}\n'+
            # load stack pointer
            '@SP\n'+
            # set A to top of stack address
            'A=M\n'+
            # set it to -1 for true
            'M=-1\n'+
            # load inc stack pointer
            f'@INC_STACK_POINTER_{labelName}\n'+
            # jump unconditionally
            '0;JMP\n'+
            # not true section
            f'(NOT_{labelName})\n'+
            # load stack pointer
            '@SP\n'+
            # set A to to top of stack address
            'A=M\n'+
            # set to 0 for false
            'M=0\n'+
            # define inc stack pointer label
            f'(INC_STACK_POINTER_{labelName})\n'+
            # load stack pointer
            '@SP\n'+
            # increment stack pointer
            'M=M+1\n')

	def writeArithmetic(self,operation):
		"""
		Performs an arithmetic or logical operation

		Parameter:
		operation: a string specifying the operation to be performed ('add','sub','neg','and','or','not','eq','gt','lt')
		"""

		arithmeticStarting1 = "@SP\n AM=M-1\n D=M\n @SP\n AM=M-1\n"
		arithmeticStarting2= "@SP\n AM=M-1\n"

		if operation=="add":
			self.file.write(f"//add\n {arithmeticStarting1} M=M+D\n @SP\n M=M+1\n")
		elif operation=="sub":
			self.file.write(f"//sub\n {arithmeticStarting1} M=M-D\n @SP\n M=M+1\n")
		elif operation =="and":
			self.file.write(f"//and\n {arithmeticStarting1} M=M&D\n @SP\n M=M+1\n")
		elif operation=="or":
			self.file.write(f"//or\n {arithmeticStarting1} M=M|D\n @SP\n M=M+1\n")

		elif operation=="not":
			self.file.write(f"//not\n {arithmeticStarting2} M=!M\n @SP\n M=M+1\n")
		elif operation=="neg":
			self.file.write(f"//neg\n {arithmeticStarting2} M=-M\n @SP\n M=M+1\n")

		elif operation in ['lt','eq','gt']:

			counter = self.arithmeticOperationCount[operation]
			counter['count']+=1
			labelName = f"{operation.upper()}{counter['count']}"

			if operation=="lt":
				self.file.write(f"{self.arithmeticStarting2(labelName,'JGE')}")# JGE")
			elif operation=="eq":
				self.file.write(f"{self.arithmeticStarting2(labelName,'JNE')}") # JNE")
			elif operation=="gt":
				self.file.write(f"{self.arithmeticStarting2(labelName,'JLE')}") # JLE")
		
			#self.file.write("@SP \nA=M \nA=A-1 \nM=!M \n")
			# self.writePushPop("C_POP",'R13')
			# self.writePushPop("C_POP",'R14')
			
			# # add asm code to execute R14=R13+R14
			# self.writePushPop("C_PUSH",'R14')

	def infiniteLoop(self):
		"""
		Writes an infinite loop for the end of asm programs
		"""
		self.file.write("(INFINITE_LOOP)\n")
		self.file.write("@INFINITE_LOOP\n")
		self.file.write("0;JMP\n")
		
			