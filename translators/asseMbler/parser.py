from SymbolTable import SymbolTable


class Parse():
    
    symObj = SymbolTable()

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
        self.indexOut = -1
        return

    def hasMoreLines(self):
        return not(self.length == (self.currentIndex + 1))

    def advance(self, whichPass):
        skip = True
        while skip:
            self.currentIndex +=1
            rawLine = self.lines[self.currentIndex]
            processedLine = rawLine.strip()
            processedLine = processedLine.replace(' ','')
            i = processedLine.find("//")

            if i!=-1:
                processedLine = processedLine[:i]
            #print("raw line: {}, currentIndex: {}, processedLine:{}".format(rawLine,self.currentIndex,processedLine))
                
            if whichPass == "firstPass":
                if processedLine!='':
                    skip = False
                    self.indexOut +=1
            else:
                if processedLine!='' and not processedLine.startswith("("):
                    skip=False
                    self.indexOut+=1

        self.currentInstruction = processedLine
        return

    def instructionType(self):
        if self.currentInstruction.startswith("@"):
            return "A_INSTRUCTION"
        elif self.currentInstruction[0] =="(":
            return "L_INSTRUCTION" 
        else:
            return "C_INSTRUCTION"

    def symbol(self):
        # make it correctly return based on whether @x, where x is a dec or var
        instruction = self.currentInstruction
        if instruction[0] =='@':
            return instruction[1:]
        else:
            return instruction[1:-1]

    def dest(self):
        if "=" in self.currentInstruction:
            index = self.currentInstruction.find("=")
            return self.currentInstruction[:index]
        else:
            return "null"

    def comp(self):
        equalIndex = self.currentInstruction.find("=")
        semiColonIndex = self.currentInstruction.find(";")

        if equalIndex == -1 and semiColonIndex == -1:
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
