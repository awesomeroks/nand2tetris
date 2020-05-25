import sys
# root = "E:\\Google Drive\\Acads\\online courses\\nand2tetris\\nand2tetris\\projects\\07\\"
# subfolder  = "MemoryAccess\\StaticTest\\"
# programName = "StaticTest.vm"
# vmFilename = root + subfolder + programName

label = 0


class Parser:
    def executeInstruction(self,instruction):
        instructionCommands = instruction.split(' ')
        if(instructionCommands[0] == 'push' or instructionCommands[0] == 'pop'):
            writer.executeMemoryInstruction(instructionCommands[0],instructionCommands[1], instructionCommands[2])
        else:
            writer.executeArithmeticInstruction(instruction)
class CodeWriter:
    def __init__(self):
        self.asmFile = None
    def setAsmFileName(self, arg):
        self.programName = arg.split('.')[0].split('/')[0]
        self.asmFile = open(self.programName + '/' + self.programName + '.asm', 'w')
        print('opened writing file at ' + arg)
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
            self.loadValue()
            self.writeInstruction('@SP')
            self.writeInstruction('AM = M - 1')
            self.writeInstruction('M = D + M')
            self.writeInstruction('@SP')
            self.writeInstruction('M = M + 1')
        elif(instructionToExecute == 'sub'):
            self.loadValue()
            self.writeInstruction('@SP')
            self.writeInstruction('AM = M - 1')
            self.writeInstruction('M = M - D')
            self.writeInstruction('@SP')
            self.writeInstruction('M = M + 1')
        elif(instructionToExecute == 'neg'):
            self.writeInstruction('@SP')
            self.writeInstruction('A = M - 1')
            self.writeInstruction('M = -M')
        elif(instructionToExecute == 'not'):
            self.writeInstruction('@SP')
            self.writeInstruction('A = M - 1')
            self.writeInstruction('M = !M')
        elif(instructionToExecute == 'or'):
            self.loadValue()
            self.writeInstruction('@SP')
            self.writeInstruction('A = M - 1')
            self.writeInstruction('M = D|M')
        elif(instructionToExecute == 'and'):
            self.loadValue()
            self.writeInstruction('@SP')
            self.writeInstruction('A = M - 1')
            self.writeInstruction('M = D&M')
        elif(instructionToExecute == 'eq'):
            self.comparisonInstruction(0)
        elif(instructionToExecute == 'gt'):
            self.comparisonInstruction(1)
        elif(instructionToExecute == 'lt'):
            self.comparisonInstruction(-1)

    def putOnStackAndIncrement(self):
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
                self.putOnStackAndIncrement()
            elif (segment == 'static'):
                self.writeInstruction('@' + self.programName + '.' + str(index))
                self.writeInstruction('D = M')
                self.putOnStackAndIncrement()
            elif (segment == 'argument'):
                self.memAccessPush('@ARG', index)
                self.putOnStackAndIncrement()
            elif (segment == 'local'):
                self.memAccessPush('@LCL', index)
                self.putOnStackAndIncrement()
            elif (segment == 'this'):
                self.memAccessPush('@THIS', index)
                self.putOnStackAndIncrement()
            elif (segment == 'that'):
                self.memAccessPush('@THAT', index)
                self.putOnStackAndIncrement()
            elif (segment == 'temp'):
                self.writeInstruction('@' + str(int(index) + 5))
                self.writeInstruction('D = M')
                self.putOnStackAndIncrement()
            elif (segment == 'pointer'):
                self.memAccessPush('@3', index)
                self.putOnStackAndIncrement()
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
    print('opened vmfile at ' + root )
    vmFile = open(root , 'r')
    for instruction in vmFile:
        instruction = instruction.strip()
        if(len(instruction)<1):
            continue
        if(instruction[0] == '/' and instruction[1] == '/'):
            continue
        print("Executing " + instruction)
        writer.writeInstruction('//' + instruction)
        parser.executeInstruction(instruction)
    writer.end()
    vmFile.close()

if __name__ == "__main__":
  main()