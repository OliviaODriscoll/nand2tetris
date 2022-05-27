###################### top section ##########################
from parse import parser
from code import CodeWriter
import os

### define a path to the file you want to translate ###
# basepath = 'G:/My Drive/2021-22/ICS4U/nand2tetris/projects/08/'
# name = "StaticsTest" #"StackTest"
# folder = f"FunctionCalls/{name}/"
# file = f'{name}.vm' # test program

### define a path to the folder you want to translate ###
basepath = 'G:/My Drive/2021-22/ICS4U/nand2tetris/projects/08/' # project 08 folder
folder = 'FunctionCalls/FibonacciElement/'  # end folder path with slash

########## define asmfile options #######
doBootStrap = True
doInfiniteLoop = True

############ search folder for .vm files ######
allfiles = os.listdir(basepath+folder)
vmfiles = list()

for file in allfiles:
    if file.endswith('.vm'):
        vmfiles.append(file)

vmfiles.reverse() # optional, lets you see sys.init at top of output code
################################################

for file in vmfiles:
    # full path to file you want to translate (input file)
    inputFilePath = basepath+folder+file
    outputFilePath = inputFilePath[:-3]+'.asm'  # full path to output file

    ### create an object that has access to input file -- determines commands to be translated ###
    # invoke the constructor method in the class parse()
    parseObj = parser(inputFilePath)

    ### create an object to serve as our output file (writes translated asm code) ###
    codeObj = CodeWriter(outputFilePath, file, doBootStrap)
    ###############################################################

    ################ translate code, line by line #################
    while parseObj.hasMoreLines():  # check if there are lines in the input file left to be parsed
        curInstruction = parseObj.advance()  # remove comments, blank lines, and get current instruction
        comType = parseObj.commandType()  # measure command type of current instruction
        arg1 = parseObj.arg1()  # arg1 of command
        arg2 = parseObj.arg2()  # arg2 of command
        codeObj.getCurInstruction(curInstruction)
        if comType == "C_PUSH" or comType == "C_POP":  # push pop command detected
            # translate a push pop command
            codeObj.writePushPop(comType, arg1, arg2)
        elif comType == 'C_LABEL':
            codeObj.writeLabel(arg1)
        elif comType == 'C_IF':
            codeObj.writeIf(arg1)
        elif comType == 'C_GOTO':
            codeObj.writeGoto(arg1)
        elif comType == 'C_FUNCTION':
            codeObj.writeFunction(arg1, arg2)
        elif comType == 'C_RETURN':
            codeObj.writeReturn()
        elif comType == "C_CALL":
            codeObj.writeCall(arg1, arg2)
        else:  # arithmetic command detected
            # translate an arithmetic command
            codeObj.writeArithmetic(parseObj.curInstruction)
        #print('{} Command: {}, Type: {}'.format(parseObj.curIndex, parseObj.curInstruction,comType))
    if doInfiniteLoop:
        codeObj.infiniteLoop()
    codeObj.file.close()

### build single output file when folder has more than one vm file ###

if len(vmfiles) > 1:
    index = 0
    fname = folder[:-1]
    while index != -1:
        index = fname.find('/')
        if index != -1:
            fname = fname[index+1:]
    asmfile = open(basepath+folder+fname+'.asm', 'w')

    for file in vmfiles:
        afile = basepath+folder+file[:-3]+'.asm'
        afile = open(afile, 'r')
        lines = afile.readlines()
        for line in lines:
            asmfile.write(line)

    asmfile.close()
