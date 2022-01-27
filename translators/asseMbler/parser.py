class parse():

    def __init__(self, path):
        # open file and get raw data
        file = open(path, "r")
        self.lines = file.readlines()
        file.close()
        # def number of lines of code
        self.length = len(self.lines)
        # set current instruction to an empty string
        self.currentInstruction = ""
        # set current index to -1
        self.currentIndex = -1

        return

    def hasMoreLines(self):
        if self.length == (self.currentIndex + 1):
            return False
        else:
            return True

    def advance(self):
        # check if line is a comment or if line is blank
        self.lines[self.currentIndex] = self.lines[self.currentIndex].strip()
        if (not self.lines[self.currentIndex].startswith("//")) or (self.lines[self.currentIndex]):
            self.currentIndex += 1
            self.currentInstruction = self.lines[self.currentIndex]

        return

    def instructionType(self):
        if self.currentInstruction.startswith("@"):
            return "A_INSTRUCTION"
        elif ";" in self.currentInstruction:
            return "C_INSTRUCTION"

    def symbol(self):
        return

    def dest(self):
        return

    def comp(self):
        return

    def jump(self):
        return
