//function SimpleFunction.test 2
(SimpleFunction.test)
@0 //initializing local variable
D = A
@SP
A = M
M = D
@SP
M = M + 1
@0 //initializing local variable
D = A
@SP
A = M
M = D
@SP
M = M + 1
//push local 0
@0
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
//push local 1
@1
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
//add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = D + M
@SP
M = M + 1
//not
@SP
A = M - 1
M = !M
//push argument 0
@0
D = A
@ARG
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
//add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = D + M
@SP
M = M + 1
//push argument 1
@1
D = A
@ARG
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
//sub
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = M - D
@SP
M = M + 1
//return
@LCL
D = M
@R14
M = D
@5
D = A
@R14
D = M - D
A = D
D = M
@R15
M = D
@0
D = A
@ARG
D = M + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
@ARG
D = M
@SP
M = D + 1
@R14
M = M - 1
A = M
D = M
@THAT
M = D
@R14
M = M - 1
A = M
D = M
@THIS
M = D
@R14
M = M - 1
A = M
D = M
@ARG
M = D
@R14
M = M - 1
A = M
D = M
@LCL
M = D
@R15
A = M
0;JMP
