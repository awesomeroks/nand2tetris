
class CompilationEngine():
    TERMINAL_TOKEN_TYPES = ["stringConstant",
                            "integerConstant", "identifier", "symbol"]
    TERMINAL_KEYWORDS = ["boolean", "class", "void", "int"]
    varDecTokens = ["static", "field", 'var']
    subroutineTokens = ["function", "method", "constructor"]
    STATEMENT_TOKENS = ['do', 'let', 'while', 'return', 'if']
    SYMBOLS = ['=', '-', ',', '&lt;', '&gt;', '\"', '+', '/', '|', '&amp;','.','*','~']

    def __init__(self, tokenizer, opFile):
        self.tokenizer = tokenizer
        self.opFile = opFile

    def write(self, label):
        self.opFile.write(label + '\n')

    def compile(self, ):
        self.compileClass()

    def writeFullTag(self, type1, label):
        self.write('<'+type1+'>' + label + '</'+type1+'>')

    def writeTag(self, label):
        self.write('<'+label+'>')

    def writeEndTag(self, label):
        self.write('</'+label+'>')

    def compileVarDec(self, tokenType, token, classType=True):
        # print("Compiling variable declarations")
        x = ''
        if(classType):
            x = 'classVarDec'
        else:
            x = 'varDec'
        self.writeTag(x)
        if(not classType):
            tokenType, token = ('', '')
        while token != ';':
            if(classType or tokenType != ''):
                self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()
        self.writeFullTag(tokenType, token)
        print(" variable declarations compiled")
        self.writeEndTag(x)

    def compileSubroutine(self, tokenType, token):
        print("Compiling subroutine", token)
        self.writeTag('subroutineDec')
        while token != '(':
            self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()
        self.writeFullTag(tokenType, token)
        tokenType, token = self.tokenizer.feed()
        self.compileParameterList(tokenType, token)
        self.compileSubroutineBody()
        print(" subroutine compiled")

        self.writeEndTag('subroutineDec')

    def writeComment(self, *args):
        x =''
        for arg in args:
            x += str(arg) + ' '
        self.write('<!-- ' + x + ' -->')

    def compileExpression(self, tokenType, token, limiter=None, writeEnd=False, writeFirst = True):
        if token == ';' :  # or self.tokenizer.getNextFeed()[1] == ';':
            print('returning')
            return (tokenType, token)
        # current token, which is a bracket.
        if token in limiter:
            # self.writeFullTag(tokenType, token)
            # tokenType, token = self.tokenizer.feed()
            return (tokenType, token)
            
        if(writeFirst):
            self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()
        self.writeTag("expression")
        
        
        x = False
        if token in ['(']:
            self.writeTag('term')
            self.compileExpression(tokenType, token, [')'])
            self.writeEndTag('term')
            # self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()
        elif token in ['[']:
            self.writeTag('term')
            self.compileExpression(tokenType, token, [']'])
            self.writeEndTag('term')
            # self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()
        while token not in limiter:
            # self.writeComment(token , self.tokenizer.getNextFeed() , self.tokenizer.getNextFeed(-2) )
            # x = False
            breaker = False
            while token in self.SYMBOLS:
                if breaker:
                    break
                
                if token in ['-','~'] and (self.tokenizer.getNextFeed()[0] in ['identifier', 'integerConstant',]) and self.tokenizer.getNextFeed(-2)[1] in ['(','[']:
                    # self.writeComment(token , self.tokenizer.getNextFeed() , self.tokenizer.getNextFeed(-2) )
                    self.writeTag('term')
                    self.writeFullTag(tokenType, token)
                    tokenType, token = self.tokenizer.feed()
                    self.writeTag('term')
                    self.writeFullTag(tokenType, token)
                    self.writeEndTag('term')
                    self.writeEndTag('term')
                    tokenType, token = self.tokenizer.feed()
                    breaker = True
                    continue
                elif token in ['-','~'] and (self.tokenizer.getNextFeed()[1] =='('):
                    # self.writeComment(token , self.tokenizer.getNextFeed() , self.tokenizer.getNextFeed(-2) )
                    self.writeTag('term')
                    self.writeFullTag(tokenType, token)
                    tokenType, token = self.tokenizer.feed()
                    self.writeTag('term')
                    self.compileExpression(tokenType, token,limiter = [')'], writeFirst = True)
                    # self.writeFullTag(tokenType, token)
                    self.writeEndTag('term')
                    self.writeEndTag('term')
                    tokenType, token = self.tokenizer.feed()
                    breaker = True
                    continue
                self.writeFullTag(tokenType, token)
                tokenType, token = self.tokenizer.feed()
                
                x = True
            if breaker:
                break
            self.writeTag('term')
            # if(x):
            #     continue
            if token in ['(']:
                # self.writeTag('term')
                self.compileExpression(tokenType, token, [')'])
                # self.writeFullTag(tokenType, token)
                tokenType, token = self.tokenizer.feed()
                self.writeEndTag('term')
                # self.writeFullTag(tokenType, token)
                # tokenType, token = self.tokenizer.feed()
                continue
            
            if self.tokenizer.getNextFeed()[1] == '.':
                print('token', token)
                self.writeFullTag(tokenType, token)
                tokenType, token = self.tokenizer.feed()
                self.writeFullTag(tokenType, token)
                tokenType, token = self.tokenizer.feed()
                while token not in limiter:
                    self.writeFullTag(tokenType, token)
                    tokenType, token = self.tokenizer.feed()
                    if token in ['(']:
                        self.writeFullTag(tokenType, token)
                        self.compileExpressionList(tokenType, token)
                        # self.writeFullTag(tokenType, token)
                        # tokenType, token = self.tokenizer.feed()
                        # self.writeEndTag('term')
                        # tokenType, token = self.tokenizer.feed()
                        self.writeEndTag('term')
                        self.writeEndTag("expression")
                        self.writeFullTag("symbol", ';')
                        print('end let', token, self.tokenizer.getNextFeed(-5),self.tokenizer.getNextFeed(1),self.tokenizer.getNextFeed(2),self.tokenizer.getNextFeed(3))
                        return (tokenType, token)
            self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()
            if token in ['[']:
                self.compileExpression(tokenType, token, [']'])
                # self.writeFullTag(tokenType, token)
                tokenType, token = self.tokenizer.feed()
                self.writeEndTag('term')
                continue
                

            self.writeEndTag('term')

        self.writeEndTag("expression")
        if(writeFirst):
            self.writeFullTag(tokenType, token)
        return (tokenType, token)
   

    def compileLetStatement(self, tokenType, token):
        self.writeTag('letStatement')
        self.writeFullTag(tokenType, token)
        tokenType, token = self.tokenizer.feed()
        x = True
        x1 = False
        while token != ';':
            x1 = False
            if token == '[':
                # self.writeFullTag(tokenType, token)
                (tokenType, token) = self.compileExpression(
                    tokenType, token, [']'])
                # x = False
                # continue
                x1 = True
                tokenType, token = self.tokenizer.feed()
            if token == '=':
                # self.writeFullTag(tokenType, token)
                (tokenType, token) = self.compileExpression(
                    tokenType, token, [';'])
                
                x = False
                break
            if x1:
                continue
            self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()
        if x:
            self.writeFullTag(tokenType, token)
        self.writeEndTag('letStatement')

    def compileExpressionList(self, tokenType, token):
        self.writeTag('expressionList')
        # print('Compiling expression list')
        tokenType, token = self.tokenizer.feed()
        print("expression list", token)
        # print(token)
        x = True
        while token != ';':
            tokenType, token = self.compileExpression(tokenType, token, [',',')'], writeFirst = False)
            if token == ')':
                self.writeEndTag('expressionList')
                self.writeFullTag(tokenType, token)
                tokenType, token = self.tokenizer.feed()
                # self.writeFullTag(tokenType, token)
                # tokenType, token = self.tokenizer.feed()
                x = False
                break
            if token ==',':
                self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()
            

        # tokenType, token = self.tokenizer.feed()
        if x:
            self.writeEndTag('expressionList')
        # self.writeFullTag(tokenType, token)

    def compileDoStatement(self, tokenType, token):
        self.writeTag('doStatement')
        # print('Compiling do statement: ', tokenType, token)
        # self.writeFullTag(tokenType, token)
        # tokenType, token = self.tokenizer.feed()
        while token != ';':
            # if token == '(':
            #     self.compileExpressionList(tokenType, token)
            #     break
            self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()

            if token == '(' or token == '[':
                self.writeFullTag(tokenType, token)
                self.compileExpressionList(tokenType, token,)
                break
        self.writeFullTag('symbol', ';')
        self.writeEndTag('doStatement')

    def compileWhileStatement(self, tokenType, token):
        self.writeTag('whileStatement')
        self.writeFullTag(tokenType, token)
        tokenType, token = self.tokenizer.feed()

        tokenType, token = self.compileExpression(tokenType, token, [')'])
        # self.writeFullTag(tokenType, token)
        tokenType, token = self.tokenizer.feed()
        self.writeFullTag(tokenType, token)
        tokenType, token = self.tokenizer.feed()
        self.compileStatements(tokenType, token)
        # if(self.tokenizer.getNextFeed()[1] == 'else'):
        #     tokenType, token = self.tokenizer.feed()
        #     self.writeFullTag(tokenType, token)
        #     tokenType, token = self.tokenizer.feed()
        #     self.writeFullTag(tokenType, token)
        #     self.compileStatements(tokenType, token)
        self.writeEndTag('whileStatement')

    def compileReturnStatement(self, tokenType, token):
        self.writeTag('returnStatement')

        if self.tokenizer.getNextFeed()[1] == ';':
            self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()
            self.writeFullTag('symbol', ';')
        else:
            self.compileExpression(tokenType, token, [';'])
        # self.writeFullTag('symbol', ';')
        self.writeEndTag('returnStatement')

    def compileIfStatement(self, tokenType, token):
        self.writeTag('ifStatement')
        self.writeFullTag(tokenType, token)
        tokenType, token = self.tokenizer.feed()
        # self.writeFullTag(tokenType, token)
        tokenType, token = self.compileExpression(tokenType, token, [')'])
        # self.writeFullTag(tokenType, token)
        tokenType, token = self.tokenizer.feed()
        self.writeFullTag(tokenType, token)
        tokenType, token = self.tokenizer.feed()
        self.compileStatements(tokenType, token)
        if(self.tokenizer.getNextFeed()[1] == 'else'):
            tokenType, token = self.tokenizer.feed()
            self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()
            self.writeFullTag(tokenType, token)
            self.compileStatements(tokenType, token)
        self.writeEndTag('ifStatement')

    def compileStatements(self, tokenType, token):
        self.writeTag('statements')
        # tokenType, token = self.tokenizer.feed()
        # 'do', 'let', 'while', 'return', 'if'
        while token != '}':
            if token == 'let':
                self.compileLetStatement(tokenType, token)
                # continue
            elif token == 'do':
                self.compileDoStatement(tokenType, token)
            elif token == 'while':
                self.compileWhileStatement(tokenType, token)
            elif token == 'return':
                self.compileReturnStatement(tokenType, token)
            elif token == 'if':
                self.compileIfStatement(tokenType, token)
            tokenType, token = self.tokenizer.feed()
            # self.writeFullTag(tokenType, token)

            # tokenType, token = self.tokenizer.feed()
        self.writeEndTag('statements')
        self.writeFullTag(tokenType, token)

    def compileSubroutineBody(self):
        self.writeTag('subroutineBody')
        tokenType, token = self.tokenizer.feed()
        self.writeFullTag(tokenType, token)
        while (self.tokenizer.getNextFeed()[1] == 'var'):
            self.compileVarDec(tokenType, token, False)
        self.compileStatements(tokenType, token)
        self.writeEndTag('subroutineBody')
        # self.writeFullTag(tokenType, token)

    def compileParameterList(self, tokenType, token):
        self.writeTag('parameterList')
        while token != ')':
            self.writeFullTag(tokenType, token)
            tokenType, token = self.tokenizer.feed()

        self.writeEndTag('parameterList')
        self.writeFullTag(tokenType, token)

    def compileClass(self):
        self.writeTag('class')
        if(self.tokenizer.feed()[1] == 'class'):
            print('Compiling class')
            self.write('<keyword> class </keyword>')
            tokenType, token = self.tokenizer.feed()
            if(tokenType == 'identifier'):
                self.write('<identifier> ' + token + ' </identifier>')
            else:
                print("Error at ", token, " expected identifier")
                return "ERROR"

            tokenType, token = self.tokenizer.feed()
            if(token == '{'):
                self.write('<symbol> ' + token + ' </symbol>')
            else:
                print("Error at ", token, " expected {")
                return "ERROR"

            while not self.tokenizer.feedFinish:
                tokenType, token = self.tokenizer.feed()
                if((tokenType, token) == ('-1', '-1')):
                    break
                if token in self.varDecTokens:
                    self.compileVarDec(tokenType, token)
                if token in self.subroutineTokens:
                    self.compileSubroutine(tokenType, token)
                    # return
        self.writeFullTag('symbol', '}')
        self.writeEndTag('class')
