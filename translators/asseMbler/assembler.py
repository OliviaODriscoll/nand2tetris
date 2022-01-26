# define path to file to be translated
import os
from parser import parse

basePath = "G:/My Drive/2021-22/ICS4U/nand2tetris/projects/06"
folder = "max"
file = "MaxL.asm"

fullPath = os.path.join(basePath,folder,file) 

# create object that has access to and can manipulate the assembly file
parseObj = parse(fullPath)

# create output file to output translated code
outFile = open(os.path.join(basePath,folder,"MaxL.hack"),"w")

# loop and translate every line of code
while parseObj.hasMoreLines():
    print(parseObj.currentIndex)
    parseObj.advance()
    instructionType = parseObj.instructionType()
    if instructionType == "A_INSTRUCTION":
        print("a")
    elif instructionType == "C_INSTRUCTION":
        print("c")
    else:
        print("undefined")

outFile.close()



