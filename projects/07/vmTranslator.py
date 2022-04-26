###################### top section ##########################
from parse import parser
from code import CodeWriter


### define a path to the file you want to translate ###
basepath = 'G:/My Drive/2021-22/ICS4U/nand2tetris/projects/07/' # project 07 folder
folder = 'StackArithmetic/StackTest/' # test folder
file= 'StackTest.vm' # test program

inputFilePath = basepath+folder+file # full path to file you want to translate (input file)
outputFilePath = inputFilePath[:-3]+'.asm' # full path to output file

### create an object that has access to input file -- determines commands to be translated ###
parseObj = parser(inputFilePath) # invoke the constructor method in the class parse()

### create an object to serve as our output file (writes translated asm code) ###
codeObj = CodeWriter(outputFilePath)
###############################################################

################ translate code, line by line #################
while parseObj.hasMoreLines():  # check if there are lines in the input file left to be parsed
    parseObj.advance() # remove comments, blank lines, and get current instruction
    comType = parseObj.commandType() # measure command type of current instruction
    if comType=="C_PUSH" or comType=="C_POP": # push pop command detected
        seg = parseObj.arg1() # segment 'seg' of command
        i = parseObj.arg2() # index 'i' of command
        codeObj.writePushPop(comType,seg,i) # translate a push pop command
    else: # arithmetic command detected
        codeObj.writeArithmetic(parseObj.curInstruction) # translate an arithmetic command

codeObj.infiniteLoop()
codeObj.file.close()