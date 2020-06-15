import sys
from JackTokenizer import *
from CompilationEngine import *

if __name__ == "__main__":
    splitter = '\\'
    root = sys.argv[1]
    print('[ARGUMENT]:', root)
    sourceFile = open(root, 'r')
    opFile = open('Output.xml', 'w')
    tokenizer = JackTokenizer(sourceFile)
    compiler = CompilationEngine(tokenizer, opFile)
    while not tokenizer.endOfFile():
        tokenizer.advance()
    tokenizer.end()
    # tokenizer.feed()
    print()
    if not tokenizer.feedFinish:
        compiler.compile()
