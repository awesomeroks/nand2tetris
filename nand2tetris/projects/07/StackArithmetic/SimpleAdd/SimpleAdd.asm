//push constant 7
@7
D = A
@SP
A = M
M = D
@SP
M = M + 1
//push constant 8
@8
D = A
@SP
A = M
M = D
@SP
M = M + 1
//eq
@SP
AM = M - 1
D = M
@SP
A = M - 1
D = M - D
M = -1
D;JEQ
@SP
A = M - 1
M = 0
(label0)
