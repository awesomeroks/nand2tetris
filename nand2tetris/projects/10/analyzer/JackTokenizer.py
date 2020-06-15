import sys
import os
class JackTokenizer():
    KEYWORDS = ['class',       'constructor',        'function',        'method',        'field',        'static',        'var',        'int',        'char',        'boolean',        'void',        'true',        'false',        'null',        'this',        'let',        'do',        'if',        'else',        'while',        'return',     ]     
    SYMBOLS = ['{', '}', '(',')', ';','.','=','-',',', '<', '>','\"','&','[',']','+','/','|','*','~']
    SYMBOLCONVERTER = {
        '<': '&lt;', 
        '>': '&gt;',
        '\"': '&quot;',
        '&': '&amp;'
    }
    def __init__(self, sourceFile):
        self.sourceFile = sourceFile
        self.tokens = []
        self.currentToken = None
        self.feedFinish = False
        self.nextToken = None
        self.currentTokenType = ''
        self.currentLine = ''
        self.currentFeedTokenNumber = 0
        self.char = self.sourceFile.read(1)
        self.nextChar = self.char
        self.opfile = open('Main.xml','w')
        self.opfile.write('<tokens>\n')
    def readChar(self):
        self.char = self.nextChar
        self.nextChar = self.sourceFile.read(1)
        # print("READING: ", ord(self.char), ' ' ,ord(self.nextChar), sep = '')
        # print(self.char, end = '')
    
    def endOfFile(self):
        cur = self.sourceFile.tell()    # save current position
        self.sourceFile.seek(0, os.SEEK_END)
        end = self.sourceFile.tell()    # find the size of file
        self.sourceFile.seek(cur, os.SEEK_SET)
        # print(cur, end)
        return cur == end
    def advance(self):

        self.readChar()
        while self.char == ' ' or  self.char == '' or self.char == '\t' or self.char == '\n' or ord(self.char) == 10:
            self.readChar()
            # print('.', end = '', sep = '')
        
        if self.char == '/' and self.nextChar == '/':
            print("SKIPPING COMMENT")
            while not self.char == '\n':
                self.readChar()
                # print(self.char, end = '')
            self.advance()

        elif self.char == '/' and self.nextChar == '*':
            print('Skipping Block comment')
            while not (self.char == '*' and self.nextChar == '/'):
                self.readChar()
                # print(self.char, end = '')
            self.readChar()
            print()
        elif self.char == '\"':
            # print("Found a string")
            self.readChar()
            self.currentToken =''
            while self.nextChar != '\"':
                self.currentToken += self.char
                self.readChar()
            self.currentToken += self.char
            # self.readChar()
            print(self.currentToken)
            self.readChar()
            self.tokens.append(('stringConstant',self.currentToken.strip()))
            self.write('<stringConstant>' + self.currentToken + '</stringConstant>')
        elif self.char in self.SYMBOLS:
            if(self.char in ['<','>','&','\"']):
                self.char = self.SYMBOLCONVERTER[self.char]
            self.tokens.append(('symbol',self.char))
            self.write('<symbol>' + self.char + '</symbol>')
        else:
            self.currentToken = ''
            tokenType = 0
            while self.currentToken not in self.KEYWORDS:
                self.currentToken += self.char
                tokenType = 0
                if(self.nextChar in self.SYMBOLS):
                    tokenType = 0
                    break
                if(self.nextChar == ' '):
                    break
                self.readChar()

            if self.currentToken in self.KEYWORDS:
                self.tokens.append(('keyword',self.currentToken))
                self.write('<keyword>' + self.currentToken + '</keyword>')
            elif self.currentToken.isnumeric():
                self.tokens.append(('integerConstant',self.currentToken.strip()))
                self.write('<integerConstant>' + self.currentToken + '</integerConstant>')
            else:
                self.tokens.append(('identifier',self.currentToken.strip()))
                self.write('<identifier>' + self.currentToken + '</identifier>')
    def write(self, label):
        self.opfile.write(label + '\n')
    def end(self):
        self.write('</tokens>')
        # print(self.tokens)
        print("EOF")
    def getNextFeed(self, offset = 0):
        if(self.currentFeedTokenNumber+1 == len(self.tokens)):
            self.feedFinish = True
            return ('-1','-1')
        retval = self.tokens[self.currentFeedTokenNumber + offset]
        # self.currentFeedTokenNumber += 1
        # print("FED NEXT: ", retval)
        return retval
    def feed(self):
        if(self.currentFeedTokenNumber == len(self.tokens)):
            self.feedFinish = True
            return ('-1','-1')
        retval = self.tokens[self.currentFeedTokenNumber]
        self.currentFeedTokenNumber += 1
        # print("FED: ", retval)
        return retval




if __name__ == "__main__":
    splitter = '\\'
    root = sys.argv[1]
    print('[ARGUMENT]:', root)
    sourceFile = open(root, 'r')
    tokenizer = JackTokenizer(sourceFile)
    while not tokenizer.endOfFile():
        tokenizer.advance()
    tokenizer.end()

