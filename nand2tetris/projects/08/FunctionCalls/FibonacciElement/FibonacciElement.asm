@256//0
D = A//1
@SP//2
M = D//3
@RETURN1 //calling Sys.init with 0//4
D = A//5
@SP//6
A = M//7
M = D//8
@SP//9
M = M + 1//10
@LCL//11
D = M//12
@SP//13
A = M//14
M = D//15
@SP//16
M = M + 1//17
@ARG//18
D = M//19
@SP//20
A = M//21
M = D//22
@SP//23
M = M + 1//24
@THIS//25
D = M//26
@SP//27
A = M//28
M = D//29
@SP//30
M = M + 1//31
@THAT//32
D = M//33
@SP//34
A = M//35
M = D//36
@SP//37
M = M + 1//38
@SP//39
D = M//40
@5//41
D = D - A//42
@ARG//43
M = D//44
@SP//45
D = M//46
@LCL//47
M = D//48
@Sys.init//49
0;JMP//50
(RETURN1)
//function Main.fibonacci 0
(Main.fibonacci)
//push argument 0
@0//51
D = A//52
@ARG//53
A = M + D//54
D = M//55
@SP//56
A = M//57
M = D//58
@SP//59
M = M + 1//60
//push constant 2
@2//61
D = A//62
@SP//63
A = M//64
M = D//65
@SP//66
M = M + 1//67
//lt
@SP//68
AM = M - 1//69
D = M//70
@SP//71
A = M - 1//72
D = M - D//73
M = -1//74
@label0//75
D;JLT//76
@SP//77
A = M - 1//78
M = 0//79
(label0)
//if-goto IF_TRUE
@SP//80
M = M - 1//81
A = M//82
D = M//83
@IF_TRUE//84
D; JNE//85
//goto IF_FALSE
@IF_FALSE//86
0;JMP//87
//label IF_TRUE
(IF_TRUE)
//push argument 0
@0//88
D = A//89
@ARG//90
A = M + D//91
D = M//92
@SP//93
A = M//94
M = D//95
@SP//96
M = M + 1//97
//return
@LCL//98
D = M//99
@R14//100
M = D//101
@5//102
D = A//103
@R14//104
D = M - D//105
A = D//106
D = M//107
@R15//108
M = D//109
@0//110
D = A//111
@ARG//112
D = M + D//113
@R13//114
M = D//115
@SP//116
AM = M - 1//117
D = M//118
@R13//119
A = M//120
M = D//121
@ARG//122
D = M//123
@SP//124
M = D + 1//125
@R14//126
M = M - 1//127
A = M//128
D = M//129
@THAT//130
M = D//131
@R14//132
M = M - 1//133
A = M//134
D = M//135
@THIS//136
M = D//137
@R14//138
M = M - 1//139
A = M//140
D = M//141
@ARG//142
M = D//143
@R14//144
M = M - 1//145
A = M//146
D = M//147
@LCL//148
M = D//149
@R15//150
A = M//151
0;JMP//152
//label IF_FALSE
(IF_FALSE)
//push argument 0
@0//153
D = A//154
@ARG//155
A = M + D//156
D = M//157
@SP//158
A = M//159
M = D//160
@SP//161
M = M + 1//162
//push constant 2
@2//163
D = A//164
@SP//165
A = M//166
M = D//167
@SP//168
M = M + 1//169
//sub
@SP//170
AM = M - 1//171
D = M//172
@SP//173
AM = M - 1//174
M = M - D//175
@SP//176
M = M + 1//177
//call Main.fibonacci 1
@RETURN2 //calling Main.fibonacci with 1//178
D = A//179
@SP//180
A = M//181
M = D//182
@SP//183
M = M + 1//184
@LCL//185
D = M//186
@SP//187
A = M//188
M = D//189
@SP//190
M = M + 1//191
@ARG//192
D = M//193
@SP//194
A = M//195
M = D//196
@SP//197
M = M + 1//198
@THIS//199
D = M//200
@SP//201
A = M//202
M = D//203
@SP//204
M = M + 1//205
@THAT//206
D = M//207
@SP//208
A = M//209
M = D//210
@SP//211
M = M + 1//212
@SP//213
D = M//214
@6//215
D = D - A//216
@ARG//217
M = D//218
@SP//219
D = M//220
@LCL//221
M = D//222
@Main.fibonacci//223
0;JMP//224
(RETURN2)
//push argument 0
@0//225
D = A//226
@ARG//227
A = M + D//228
D = M//229
@SP//230
A = M//231
M = D//232
@SP//233
M = M + 1//234
//push constant 1
@1//235
D = A//236
@SP//237
A = M//238
M = D//239
@SP//240
M = M + 1//241
//sub
@SP//242
AM = M - 1//243
D = M//244
@SP//245
AM = M - 1//246
M = M - D//247
@SP//248
M = M + 1//249
//call Main.fibonacci 1
@RETURN3 //calling Main.fibonacci with 1//250
D = A//251
@SP//252
A = M//253
M = D//254
@SP//255
M = M + 1//256
@LCL//257
D = M//258
@SP//259
A = M//260
M = D//261
@SP//262
M = M + 1//263
@ARG//264
D = M//265
@SP//266
A = M//267
M = D//268
@SP//269
M = M + 1//270
@THIS//271
D = M//272
@SP//273
A = M//274
M = D//275
@SP//276
M = M + 1//277
@THAT//278
D = M//279
@SP//280
A = M//281
M = D//282
@SP//283
M = M + 1//284
@SP//285
D = M//286
@6//287
D = D - A//288
@ARG//289
M = D//290
@SP//291
D = M//292
@LCL//293
M = D//294
@Main.fibonacci//295
0;JMP//296
(RETURN3)
//add
@SP//297
AM = M - 1//298
D = M//299
@SP//300
AM = M - 1//301
M = D + M//302
@SP//303
M = M + 1//304
//return
@LCL//305
D = M//306
@R14//307
M = D//308
@5//309
D = A//310
@R14//311
D = M - D//312
A = D//313
D = M//314
@R15//315
M = D//316
@0//317
D = A//318
@ARG//319
D = M + D//320
@R13//321
M = D//322
@SP//323
AM = M - 1//324
D = M//325
@R13//326
A = M//327
M = D//328
@ARG//329
D = M//330
@SP//331
M = D + 1//332
@R14//333
M = M - 1//334
A = M//335
D = M//336
@THAT//337
M = D//338
@R14//339
M = M - 1//340
A = M//341
D = M//342
@THIS//343
M = D//344
@R14//345
M = M - 1//346
A = M//347
D = M//348
@ARG//349
M = D//350
@R14//351
M = M - 1//352
A = M//353
D = M//354
@LCL//355
M = D//356
@R15//357
A = M//358
0;JMP//359
//function Sys.init 0
(Sys.init)
//push constant 4
@4//360
D = A//361
@SP//362
A = M//363
M = D//364
@SP//365
M = M + 1//366
//call Main.fibonacci 1
@RETURN4 //calling Main.fibonacci with 1//367
D = A//368
@SP//369
A = M//370
M = D//371
@SP//372
M = M + 1//373
@LCL//374
D = M//375
@SP//376
A = M//377
M = D//378
@SP//379
M = M + 1//380
@ARG//381
D = M//382
@SP//383
A = M//384
M = D//385
@SP//386
M = M + 1//387
@THIS//388
D = M//389
@SP//390
A = M//391
M = D//392
@SP//393
M = M + 1//394
@THAT//395
D = M//396
@SP//397
A = M//398
M = D//399
@SP//400
M = M + 1//401
@SP//402
D = M//403
@6//404
D = D - A//405
@ARG//406
M = D//407
@SP//408
D = M//409
@LCL//410
M = D//411
@Main.fibonacci//412
0;JMP//413
(RETURN4)
//label WHILE
(WHILE)
//goto WHILE
@WHILE//414
0;JMP//415
