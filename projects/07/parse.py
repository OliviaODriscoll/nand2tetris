class parser():

	def __init__(self,path):
		file = open(path,'r')
		self.lines = file.readlines()
		self.L = len(self.lines)
		self.curIndex = -1
		self.curInstruction = ''
		file.close()
		self.argument1 = ''
		return

	def hasMoreLines(self):
		if self.curIndex==self.L-1:
			return False
		return True

	def advance(self):
		keepAdvancing = True
		while keepAdvancing:
			self.curIndex+=1
			instruction = self.lines[self.curIndex]
			instruction = instruction.strip()
			if not (instruction.startswith('//') or instruction==''):
				keepAdvancing = False
		self.curInstruction = instruction

	def commandType(self):
		instruction = self.curInstruction
		if instruction.startswith('pop'):
			return "C_POP"
		elif instruction.startswith('push'):
			return "C_PUSH"
		elif instruction.startswith('label'):
			return "C_LABEL"
		elif instruction.startswith('goto'):
			return "C_GOTO"
		elif instruction.startswith('if'):
			return "C_IF"
		elif instruction.startswith('function'):
			return "C_FUNCTION"
		elif instruction.startswith('return'):
			return "C_RETURN"
		elif instruction.startswith('call'):
			return "C_CALL"
		else:
			return "C_ARITHMETIC"

	def arg1(self):
		instruction = self.curInstruction
		index = instruction.find(" ")
		instruction = instruction[index+1:]
		index = instruction.find(' ')
		if not index == -1:
			return instruction[:index]
		else: 
			return instruction

	def arg2(self):
		instruction = self.curInstruction
		index = instruction.find(" ")
		instruction = instruction[index+1:]
		index = instruction.find(' ')
		return instruction[index+1:]