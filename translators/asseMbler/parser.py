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
        return not(self.length == (self.currentIndex + 1))

    def advance(self):
        skip = True
        while skip:
            self.currentIndex +=1
            rawLine = self.lines[self.currentIndex]
            processedLine = rawLine.strip()
            processedLine = processedLine.replace(' ','')

            if "//" in processedLine: # found comment
                commentIndex = processedLine.find("//")
                processedLine = processedLine[:commentIndex]

            if processedLine!='':
                skip = False
        
        self.currentInstruction = processedLine
        return

    def instructionType(self):
        if self.currentInstruction.startswith("@"):
            return "A_INSTRUCTION"
        else:
            return "C_INSTRUCTION"

    def symbol(self):
        return self.currentInstruction[1:]

    def dest(self):
        if "=" in self.currentInstruction:
            index = self.currentInstruction.find("=")
            return self.currentInstruction[:index]
        else:
            return "null"

    def comp(self):
        equalIndex = self.currentInstruction.find("=")
        semiColonIndex = self.currentInstruction.find(";")

        if equalIndex ==-1 and semiColonIndex == -1:
            return self.currentInstruction()
        elif equalIndex == -1:
            return self.currentInstruction[:semiColonIndex]
        elif semiColonIndex == -1:
            return self.currentInstruction[equalIndex+1:]
        else:
            return self.currentInstruction[equalIndex+1:semiColonIndex]


    def jump(self):
        if ";" in self.currentInstruction:
            index = self.currentInstruction.find(";")
            return self.currentInstruction[index+1:]
        else:
            return "null"