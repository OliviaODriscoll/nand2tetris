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
        return True

    def advance(self):
        skip = True
        while skip:
            self.currentIndex +=1
            rawLine = self.lines[self.currentIndex]
            processedLine = rawLine.strip()
            processedLine = processedLine.replace(' ','')

            if "//" in processedLine: # found comment
                processedLine = processedLine[:1]

            if processedLine!='':
                skip = False
        
        self.currentInstruction = processedLine
        return

    def instructionType(self):
        if self.currentInstruction.startswith("@"):
            return "A_INSTRUCTION"
        elif ";" in self.currentInstruction:
            return "C_INSTRUCTION"

    def symbol(self):
        return self.currentInstruction[1:]

    def dest(self):
        if "=" in self.currentInstruction:
            index = self.instruction.find("=")
            return self.instruction[:index]
        else:
            return "null"
        return

    def comp(self):
        semiColonIndex = self.currentInstruction.find(";")
        equalIndex = self.currentInstruction.find("=") + 1

        if not ("=" and ";" in self.currentInstruction):
            return self.currentInstruction

        elif not "=" in self.currentInstruction:
            return self.currentInstruction[:semiColonIndex]

        elif not ";" in self.currentInstruction:
            return self.currentInstruction[equalIndex:]

        else:
            return self.currentInstruction[equalIndex:semiColonIndex]


    def jump(self):
        if ";" in self.currentInstruction:
            index = self.currentInstruction.find(";") + 1
            return self.currentInstruction[index:]
        else:
            return "null"