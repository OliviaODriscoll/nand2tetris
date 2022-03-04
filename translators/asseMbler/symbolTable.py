class SymbolTable():

    def __init__(self):
        self.symbolTable = dict()
        self.predefinedSymbols()
        self.nextAddress = 16
        return

    def predefinedSymbols(self):
        # update SP, LCL, ARG, THIS, THAT
        self.symbolTable.update({"SP": "0"})
        self.symbolTable.update({"LCL": "1"})
        self.symbolTable.update({"ARG": "2"})
        self.symbolTable.update({"THIS": "3"})
        self.symbolTable.update({"THAT": "4"})

        ## Screen and KBD
        self.symbolTable.update({"SCREEN": "16384"})
        self.symbolTable.update({"KBD": "24576"})

        # add R0 to R15 in addresses 0 to 15
        for i in range(16):
            keyName = "R{}".format(str(i))
            self.symbolTable.update({keyName: str(i)})

    def contains(self, key):
        # if key param is in dict, return true
        return (key in self.symbolTable.keys())

    def addEntry(self, key, value):
        # add new key to dict
        self.symbolTable.update({key:value})
        return

    def getAddress(self, key):
        # return val of dict by finding it with param key
        return self.symbolTable.get(key)
