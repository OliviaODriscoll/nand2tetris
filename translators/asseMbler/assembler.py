# import dependencies
import os

import writeCode as code
from Parser import Parse
from SymbolTable import SymbolTable

# define file paths
basePath = "G:/My Drive/2021-22/ICS4U/nand2tetris/projects/06"
folder = "pong"
file = "Pong.asm"
outFileName = file.strip(".asm") + ".hack"
fullPath = os.path.join(basePath, folder, file)

# create object that has access to and can manipulate the assembly file
parseObject = Parse(fullPath)

# create an object to serve as our symbol table
symbolObject = SymbolTable()

# create output file to output translated code
outFile = open(os.path.join(basePath, folder, outFileName), "w")

# reset our file indices
parseObject.currentIndex = -1
parseObject.indexOut = -1

# translate code line by line, 1st pass
while parseObject.hasMoreLines():

    parseObject.advance('firstPass')
    # first pass goal figures out what address labels will become
    instructionType = parseObject.instructionType()

    if instructionType == "L_INSTRUCTION":
        # if the instruction is an L instruction, skip this index (i.e. remove labels)
        parseObject.indexOut -= 1
        # add the label to the symbol table
        address = parseObject.symbol()
        symbolObject.addEntry(address, str(parseObject.indexOut + 1))

# reset our file indices for the second pass
parseObject.currentIndex = -1
parseObject.indexOut = -1

# loop and translate every line of code, 2nd pass
while parseObject.hasMoreLines():
    parseObject.advance('secondPass')
    instructionType = parseObject.instructionType()

    if instructionType == "A_INSTRUCTION":
        address = parseObject.symbol()
        if not address.isnumeric():
            # calculate binary version of address
            if not symbolObject.contains(address):
                # add the address to our symbol table at the next available memory address
                symbolObject.addEntry(address, str(symbolObject.nextAddress))
                symbolObject.nextAddress += 1
            # retrieve the memory address corresponding to the a-instruction adress in symbol table
            address = symbolObject.getAddress(address)
        
        # convert the line to binary
        binaryAddress = bin(int(address))
        binaryAddress = binaryAddress[2:]
        diff = 15-len(binaryAddress)
        binaryAddress = '0'*diff+binaryAddress
        binaryAddress = '0'+binaryAddress+'\n'
        outFile.write(binaryAddress)

    else:
        # return the binary code for dest, comp, jump commands
        dest = parseObject.dest()
        comp = parseObject.comp()
        jump = parseObject.jump()
        binDest = code.dest(dest)
        binJump = code.jump(jump)
        binComp = code.comp(comp)

        # calculate full binary c instruction
        binC = '111'+binComp+binDest+binJump+'\n'
        outFile.write(binC)

outFile.close()
