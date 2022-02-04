# define path to file to be translated
from ctypes import addressof
import os
from parser import parse
import writeCode as code
import symbolTable

basePath = "G:/My Drive/2021-22/ICS4U/nand2tetris/projects/06"
folder = "add"
file = "add.asm"
outFileName = file.strip(".asm") + ".hack"


fullPath = os.path.join(basePath, folder, file)

# create object that has access to and can manipulate the assembly file
parseObj = parse(fullPath)

# create an object to serve as our symbol table
symbolObj = symbolTable()

## translate code line by line, 1st pass
while parseObj.hasMoreLines():
    parseObj.advance('firstPass')
    # first pass goal figures out what address labels will become

# create output file to output translated code
outFile = open(os.path.join(basePath, folder, outFileName), "w")

# loop and translate every line of code, 2nd pass
while parseObj.hasMoreLines():
    parseObj.advance('secondPass')
    instructionType = parseObj.instructionType()
    if instructionType == "A_INSTRUCTION":
        address = parseObj.symbol()
        # calculate binary version of address
        binAddress = bin(int(address))
        binAddress = binAddress[2:]
        diff = 15-len(binAddress)
        binAddress = '0'*diff+binAddress
        binAddress = '0'+binAddress+'\n'
        outFile.write(binAddress)
    else:
        dest = parseObj.dest()
        comp = parseObj.comp()
        jump = parseObj.jump()

        # calculate binary versions of dest, bin, and comp
        binDest = code.dest(dest)
        binJump = code.jump(jump)
        binComp = code.comp(comp)
        
        # calculate full binary c instruction
        binC = '111'+binComp+binDest+binJump+'\n'
        outFile.write(binC)

outFile.close()

"""
"""