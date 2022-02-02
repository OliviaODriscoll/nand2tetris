# define path to file to be translated
from ctypes import addressof
import os
from parser import parse
import code_writer

basePath = "G:/My Drive/2021-22/ICS4U/nand2tetris/projects/06"
folder = "max"
file = "MaxL.asm"

fullPath = os.path.join(basePath, folder, file)

# create object that has access to and can manipulate the assembly file
parseObj = parse(fullPath)

# create output file to output translated code
outFile = open(os.path.join(basePath, folder, "MaxL.hack"), "w")

# loop and translate every line of code
while parseObj.hasMoreLines():
    parseObj.advance()
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
        binDest = code_writer.dest(dest)
        binJump = code_writer.jump(jump)
        binComp = code_writer.comp(comp)
        
        # calculate full binary c instruction
        binC = '111'+binComp+binDest+binJump+'\n'
        outFile.write(binC)

outFile.close()
