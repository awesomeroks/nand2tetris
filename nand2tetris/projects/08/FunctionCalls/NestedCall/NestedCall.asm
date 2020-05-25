@256
D = A
@SP
M = D
@RETURN1 //calling Sys.init with 0
D = A
@SP
A = M
M = D
@SP
M = M + 1
@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1
@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1
@SP
D = M
@5
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Sys.init
0;JMP
(RETURN1)
//function Sys.init 0
(Sys.init)
//push constant 4000
@4000
D = A
@SP
A = M
M = D
@SP
M = M + 1
//pop pointer 0
@0
D = A
@3
D = A + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
//push constant 5000
@5000
D = A
@SP
A = M
M = D
@SP
M = M + 1
//pop pointer 1
@1
D = A
@3
D = A + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
//call Sys.main 0
@RETURN2 //calling Sys.main with 0
D = A
@SP
A = M
M = D
@SP
M = M + 1
@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1
@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1
@SP
D = M
@5
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Sys.main
0;JMP
(RETURN2)
//pop temp 1
@6
D = A
//
D = M + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
//label LOOP
(LOOP)
//goto LOOP
@LOOP
0;JMP
//function Sys.main 5
(Sys.main)
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
@0 //initializing local variable
D = A
@SP
A = M
M = D
@SP
M = M + 1
//push constant 4001
@4001
D = A
@SP
A = M
M = D
@SP
M = M + 1
//pop pointer 0
@0
D = A
@3
D = A + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
//push constant 5001
@5001
D = A
@SP
A = M
M = D
@SP
M = M + 1
//pop pointer 1
@1
D = A
@3
D = A + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
//push constant 200
@200
D = A
@SP
A = M
M = D
@SP
M = M + 1
//pop local 1
@1
D = A
@LCL
D = M + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
//push constant 40
@40
D = A
@SP
A = M
M = D
@SP
M = M + 1
//pop local 2
@2
D = A
@LCL
D = M + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
//push constant 6
@6
D = A
@SP
A = M
M = D
@SP
M = M + 1
//pop local 3
@3
D = A
@LCL
D = M + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
//push constant 123
@123
D = A
@SP
A = M
M = D
@SP
M = M + 1
//call Sys.add12 1
@RETURN3 //calling Sys.add12 with 1
D = A
@SP
A = M
M = D
@SP
M = M + 1
@LCL
D = M
@SP
A = M
M = D
@SP
M = M + 1
@ARG
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THIS
D = M
@SP
A = M
M = D
@SP
M = M + 1
@THAT
D = M
@SP
A = M
M = D
@SP
M = M + 1
@SP
D = M
@6
D = D - A
@ARG
M = D
@SP
D = M
@LCL
M = D
@Sys.add12
0;JMP
(RETURN3)
//pop temp 0
@5
D = A
//
D = M + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
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
//push local 2
@2
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
//push local 3
@3
D = A
@LCL
A = M + D
D = M
@SP
A = M
M = D
@SP
M = M + 1
//push local 4
@4
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
//add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = D + M
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
//add
@SP
AM = M - 1
D = M
@SP
AM = M - 1
M = D + M
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
//function Sys.add12 0
(Sys.add12)
//push constant 4002
@4002
D = A
@SP
A = M
M = D
@SP
M = M + 1
//pop pointer 0
@0
D = A
@3
D = A + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
//push constant 5002
@5002
D = A
@SP
A = M
M = D
@SP
M = M + 1
//pop pointer 1
@1
D = A
@3
D = A + D
@R13
M = D
@SP
AM = M - 1
D = M
@R13
A = M
M = D
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
//push constant 12
@12
D = A
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
