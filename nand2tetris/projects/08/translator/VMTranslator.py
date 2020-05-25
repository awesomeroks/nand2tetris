import sys
from os import listdir
from os.path import isfile, join
label = 0

 
class Parser:
    def executeInstruction(self,instruction):
        instructionCommands = instruction.split(' ')
        if(instructionCommands[0] == 'push' or instructionCommands[0] == 'pop'):
            print("[EXE]: [PUSH/POP]: " + instruction, end = ' ')
            writer.executeMemoryInstruction(instructionCommands[0],instructionCommands[1], instructionCommands[2])
        elif instructionCommands[0] == 'goto':
            print("[EXE]: [GOTO]: " + instruction, end = ' ')
            writer.gotoFunction(instructionCommands[1])
        elif instructionCommands[0] == 'function':
            print("[EXE]: [FUNCTIONSETUP]: " + instruction, end = ' ')
            writer.functionSetup(instructionCommands[1], instructionCommands[2])
        elif instructionCommands[0] == 'if-goto':
            print("[EXE]: [IFGOTO]: " + instruction, end = ' ')
            writer.ifGotoFunction(instructionCommands[1])
        elif instructionCommands[0] == 'return':
            print("[EXE]: [RETURN FUNCTION]: " + instruction, end = ' ')
            writer.executeReturnInstruction()
        elif instructionCommands[0] =='call':
            print("[EXE]: [CALL FUNCTION]: " + instruction, end = ' ')
            writer.writeCall(instructionCommands[1], instructionCommands[2])
        elif instructionCommands[0] == 'label':
            print("[EXE]: [WRITE LABEL]: " + instruction, end = ' ')
            writer.writeLabel(instructionCommands[1])
        else:
            
            writer.executeArithmeticInstruction(instruction)

class CodeWriter:
    def __init__(self):
        self.asmFile = None
        self.functionCount = 0
    def writeLabel(self, label):
        self.writeInstruction('(' + label + ')')
    def initVm(self):
        self.writeInstruction('@256')
        self.writeInstruction('D = A')
        self.writeInstruction('@SP')
        self.writeInstruction('M = D')
        self.writeCall('Sys.init', '0')
    def putPointersOnStack(self, pointers =['@LCL', '@ARG', '@THIS', '@THAT'] ):
        for i in pointers:
            self.writeInstruction(i)
            self.writeInstruction('D = M')
            self.putDOnStack()
    def restorePointersFromStack(self, pointers = ['@THAT', '@THIS', '@ARG', '@LCL']):
        for i in pointers:
            self.writeInstruction('@R14')
            self.writeInstruction('M = M - 1')
            self.writeInstruction('A = M')
            self.writeInstruction('D = M')
            self.writeInstruction(i)
            self.writeInstruction('M = D')
    def executeReturnInstruction(self):
        self.writeInstruction('@LCL') #goto the starting of the local segment
        self.writeInstruction('D = M')
        self.writeInstruction('@R14') #and store address in R14
        self.writeInstruction('M = D')
        #get return address
        self.writeInstruction('@5')
        self.writeInstruction('D = A')
        self.writeInstruction('@R14')
        self.writeInstruction('D = M - D')
        self.writeInstruction('A = D')
        self.writeInstruction('D = M') #final return address is stored here in D
        #store final return address in R15
        self.writeInstruction('@R15')
        self.writeInstruction('M = D')

        self.memAccessPop('@ARG', '0')
        self.writeInstruction('@ARG')
        self.writeInstruction('D = M')
        self.writeInstruction('@SP')
        self.writeInstruction('M = D + 1')


        #restore pointers
        self.restorePointersFromStack()
        #complete return call
        self.writeInstruction('@R15')
        self.writeInstruction('A = M')
        self.writeInstruction('0;JMP')


    def writeCall(self, functionName, nArgs):
        self.functionCount += 1
        self.writeInstruction('@RETURN' + str(self.functionCount) +' //calling ' + str(functionName) + ' with ' + nArgs)
        self.writeInstruction('D = A')
        self.putDOnStack()
        self.putPointersOnStack()
        self.writeInstruction('@SP')
        self.writeInstruction('D = M')
        self.writeInstruction('@' + str(int(nArgs) + 5))
        self.writeInstruction('D = D - A')
        self.writeInstruction('@ARG')
        self.writeInstruction('M = D')
        self.writeInstruction('@SP')
        self.writeInstruction('D = M')
        self.writeInstruction('@LCL')
        self.writeInstruction('M = D')
        self.gotoFunction(functionName)
        self.writeInstruction('(RETURN' + str(self.functionCount) + ')')

    def gotoFunction(self, label):
        self.writeInstruction('@' + label)
        self.writeInstruction('0;JMP')
    def ifGotoFunction(self, label):
        self.writeInstruction('@SP')
        self.writeInstruction('M = M - 1')
        self.writeInstruction('A = M')
        self.writeInstruction('D = M')
        self.writeInstruction('@' + label)
        self.writeInstruction('D; JNE')


    def functionSetup(self, functionName, nLocalVars):
        self.writeInstruction('(' + functionName + ')')
        for i in range(int(nLocalVars)):
            self.putDOnStack('0 //initializing local variable')

    def setAsmFileName(self, arg):
        # self.programName = arg.split('.')[0].split('\\')[0]
        # self.asmFile = open(self.programName + '/' + self.programName + '.asm', 'w')
        temp = arg.split('\\')
        temp.pop(-1)
        print(temp)
        self.programName = temp[-1]
        val = '\\'
        val = val.join(temp)
        val +=  '\\' + self.programName + '.asm'
        self.asmFile = open(val ,'w')
        print('opened writing file at ' + val)
        # self.initVm()
    def writeInstruction(self,instructionToWrite):
        self.asmFile.write(instructionToWrite + '\n')
    def end(self):
        self.asmFile.close()
    def loadValue(self):
        self.writeInstruction('@SP')
        self.writeInstruction('AM = M - 1') #indirect access
        self.writeInstruction('D = M')
    def comparisonInstruction(self,change):
        # change = - 1 check less than
        # change = 0 check equal
        # change = 1 check greater than
        global label
        self.loadValue()
        self.writeInstruction('@SP')
        self.writeInstruction('A = M - 1')
        self.writeInstruction('D = M - D')
        self.writeInstruction('M = -1') #Assume that its lt
        self.writeInstruction('@label' + str(label))
        jumpString = 'J'
        if(change == -1):
            jumpString += 'LT'
        elif (change == 0):
            jumpString += 'EQ'
        elif(change == 1):
            jumpString += 'GT'
        self.writeInstruction('D;' + jumpString)
        self.writeInstruction('@SP')
        self.writeInstruction('A = M - 1')
        self.writeInstruction('M = 0')
        self.writeInstruction('(label' + str(label) + ')')
        label += 1

    def executeArithmeticInstruction(self,instructionToExecute):
        if(instructionToExecute == 'add'):
            print("[EXE]: [ADD]: " + instructionToExecute, end = ' ')
            self.loadValue()
            self.writeInstruction('@SP')
            self.writeInstruction('AM = M - 1')
            self.writeInstruction('M = D + M')
            self.writeInstruction('@SP')
            self.writeInstruction('M = M + 1')
        elif(instructionToExecute == 'sub'):
            print("[EXE]: [SUB]: " + instructionToExecute, end = ' ')
            self.loadValue()
            self.writeInstruction('@SP')
            self.writeInstruction('AM = M - 1')
            self.writeInstruction('M = M - D')
            self.writeInstruction('@SP')
            self.writeInstruction('M = M + 1')
        elif(instructionToExecute == 'neg'):
            print("[EXE]: [NEG]: " + instructionToExecute, end = ' ')
            self.writeInstruction('@SP')
            self.writeInstruction('A = M - 1')
            self.writeInstruction('M = -M')
        elif(instructionToExecute == 'not'):
            print("[EXE]: [NOT]: " + instructionToExecute, end = ' ')
            self.writeInstruction('@SP')
            self.writeInstruction('A = M - 1')
            self.writeInstruction('M = !M')
        elif(instructionToExecute == 'or'):
            print("[EXE]: [OR]: " + instructionToExecute, end = ' ')
            self.loadValue()
            self.writeInstruction('@SP')
            self.writeInstruction('A = M - 1')
            self.writeInstruction('M = D|M')
        elif(instructionToExecute == 'and'):
            print("[EXE]: [AND]: " + instructionToExecute, end = ' ')
            self.loadValue()
            self.writeInstruction('@SP')
            self.writeInstruction('A = M - 1')
            self.writeInstruction('M = D&M')
        elif(instructionToExecute == 'eq'):
            print("[EXE]: [EQ]: " + instructionToExecute, end = ' ')
            self.comparisonInstruction(0)
        elif(instructionToExecute == 'gt'):
            print("[EXE]: [GT]: " + instructionToExecute, end = ' ')
            self.comparisonInstruction(1)
        elif(instructionToExecute == 'lt'):
            print("[EXE]: [LT]: " + instructionToExecute, end = ' ')
            self.comparisonInstruction(-1)

    def putDOnStack(self, value = ''):
        if(value != ''): # if D is not initialized already
            self.writeInstruction('@' + value)
            self.writeInstruction('D = A')
        self.writeInstruction('@SP')
        self.writeInstruction('A = M')
        self.writeInstruction('M = D')
        self.writeInstruction('@SP')
        self.writeInstruction('M = M + 1')

    def memAccessPush(self,segmentString, index):
        self.writeInstruction('@' + str(index))
        self.writeInstruction('D = A')
        self.writeInstruction(segmentString)
        if(segmentString == '@3'):
            self.writeInstruction('A = A + D')
        else:
            self.writeInstruction('A = M + D')
        self.writeInstruction('D = M')



    def memAccessPop(self,segmentString, index):
        self.writeInstruction('@' + str(index))
        self.writeInstruction('D = A')
        self.writeInstruction(segmentString)
        if(segmentString == '@3'):
            self.writeInstruction('D = A + D')
        else:
            self.writeInstruction('D = M + D')
        self.writeInstruction('@R13')
        self.writeInstruction('M = D')
        self.writeInstruction('@SP')
        self.writeInstruction('AM = M - 1')
        self.writeInstruction('D = M')
        self.writeInstruction('@R13')
        self.writeInstruction('A = M')
        self.writeInstruction('M = D')
    def executeMemoryInstruction(self,pushPop, segment, index):
        if(pushPop == "push"):
            if(segment == 'constant'):
                self.writeInstruction('@' + index)
                self.writeInstruction('D = A')
                self.putDOnStack()
            elif (segment == 'static'):
                self.writeInstruction('@' + self.programName + '.' + str(index))
                self.writeInstruction('D = M')
                self.putDOnStack()
            elif (segment == 'argument'):
                self.memAccessPush('@ARG', index)
                self.putDOnStack()
            elif (segment == 'local'):
                self.memAccessPush('@LCL', index)
                self.putDOnStack()
            elif (segment == 'this'):
                self.memAccessPush('@THIS', index)
                self.putDOnStack()
            elif (segment == 'that'):
                self.memAccessPush('@THAT', index)
                self.putDOnStack()
            elif (segment == 'temp'):
                self.writeInstruction('@' + str(int(index) + 5))
                self.writeInstruction('D = M')
                self.putDOnStack()
            elif (segment == 'pointer'):
                self.memAccessPush('@3', index)
                self.putDOnStack()
            else:
                self.writeInstruction('//Skipping')
        else:
            if(segment == 'static'):
                self.writeInstruction('@SP')
                self.writeInstruction('AM = M - 1')
                self.writeInstruction('D = M')
                self.writeInstruction('@' + self.programName + '.' + str(index))
                self.writeInstruction('M = D')
            elif (segment == 'this'):
                self.memAccessPop('@THIS', index)
            elif(segment == 'that'):
                self.memAccessPop('@THAT', index)
            elif(segment == 'argument'):
                self.memAccessPop('@ARG', index)
            elif(segment == 'local'):
                self.memAccessPop('@LCL', index)
            elif(segment == 'pointer'):
                self.memAccessPop('@3', index)

            elif(segment == 'temp'):
                self.memAccessPop('//', str(int(index) + 5) )
            else:
                self.writeInstruction('//Skipping')

writer = CodeWriter()
def main():
    root = sys.argv[1]
    writer.setAsmFileName(root + ".asm")
    parser = Parser()
    print('opened vmfile directory at ' + root )
    tempFilenames = [f for f in listdir(root) if isfile(join(root, f))]
    fileNames = []
    for f in tempFilenames:
        if f.split('.')[1] == 'vm':
            fileNames += [f]
    print('Found ' + str(len(fileNames)) + ' files: ' + str(fileNames))
    for f in fileNames:
        print('[OPENING FILE]: ' + f)
        vmFile =  open(root + f , 'r')
        for instruction in vmFile:
            instruction = instruction.split('/')[0]
            instruction = instruction.strip()
            if(len(instruction)<1):
                continue
            if(instruction[0] == '/' and instruction[1] == '/'):
                continue

            writer.writeInstruction('//' + instruction)
            parser.executeInstruction(instruction)
            print(' \t\t...DONE')
        vmFile.close()
    print()
    writer.end()
   

if __name__ == "__main__":
  main()