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
//function Sys.init 0
(Sys.init)
//push constant 4000
@4000//51
D = A//52
@SP//53
A = M//54
M = D//55
@SP//56
M = M + 1//57
//pop pointer 0
@0//58
D = A//59
@3//60
D = A + D//61
@R13//62
M = D//63
@SP//64
AM = M - 1//65
D = M//66
@R13//67
A = M//68
M = D//69
//push constant 5000
@5000//70
D = A//71
@SP//72
A = M//73
M = D//74
@SP//75
M = M + 1//76
//pop pointer 1
@1//77
D = A//78
@3//79
D = A + D//80
@R13//81
M = D//82
@SP//83
AM = M - 1//84
D = M//85
@R13//86
A = M//87
M = D//88
//call Sys.main 0
@RETURN2 //calling Sys.main with 0//89
D = A//90
@SP//91
A = M//92
M = D//93
@SP//94
M = M + 1//95
@LCL//96
D = M//97
@SP//98
A = M//99
M = D//100
@SP//101
M = M + 1//102
@ARG//103
D = M//104
@SP//105
A = M//106
M = D//107
@SP//108
M = M + 1//109
@THIS//110
D = M//111
@SP//112
A = M//113
M = D//114
@SP//115
M = M + 1//116
@THAT//117
D = M//118
@SP//119
A = M//120
M = D//121
@SP//122
M = M + 1//123
@SP//124
D = M//125
@5//126
D = D - A//127
@ARG//128
M = D//129
@SP//130
D = M//131
@LCL//132
M = D//133
@Sys.main//134
0;JMP//135
(RETURN2)
//pop temp 1
@1//136
D = A//137
@5//138
D = A + D//139
@R13//140
M = D//141
@SP//142
AM = M - 1//143
D = M//144
@R13//145
A = M//146
M = D//147
//label LOOP
(LOOP)
//goto LOOP
@LOOP//148
0;JMP//149
//function Sys.main 5
(Sys.main)
@0 //initializing local variable//150
D = A//151
@SP//152
A = M//153
M = D//154
@SP//155
M = M + 1//156
@0 //initializing local variable//157
D = A//158
@SP//159
A = M//160
M = D//161
@SP//162
M = M + 1//163
@0 //initializing local variable//164
D = A//165
@SP//166
A = M//167
M = D//168
@SP//169
M = M + 1//170
@0 //initializing local variable//171
D = A//172
@SP//173
A = M//174
M = D//175
@SP//176
M = M + 1//177
@0 //initializing local variable//178
D = A//179
@SP//180
A = M//181
M = D//182
@SP//183
M = M + 1//184
//push constant 4001
@4001//185
D = A//186
@SP//187
A = M//188
M = D//189
@SP//190
M = M + 1//191
//pop pointer 0
@0//192
D = A//193
@3//194
D = A + D//195
@R13//196
M = D//197
@SP//198
AM = M - 1//199
D = M//200
@R13//201
A = M//202
M = D//203
//push constant 5001
@5001//204
D = A//205
@SP//206
A = M//207
M = D//208
@SP//209
M = M + 1//210
//pop pointer 1
@1//211
D = A//212
@3//213
D = A + D//214
@R13//215
M = D//216
@SP//217
AM = M - 1//218
D = M//219
@R13//220
A = M//221
M = D//222
//push constant 200
@200//223
D = A//224
@SP//225
A = M//226
M = D//227
@SP//228
M = M + 1//229
//pop local 1
@1//230
D = A//231
@LCL//232
D = M + D//233
@R13//234
M = D//235
@SP//236
AM = M - 1//237
D = M//238
@R13//239
A = M//240
M = D//241
//push constant 40
@40//242
D = A//243
@SP//244
A = M//245
M = D//246
@SP//247
M = M + 1//248
//pop local 2
@2//249
D = A//250
@LCL//251
D = M + D//252
@R13//253
M = D//254
@SP//255
AM = M - 1//256
D = M//257
@R13//258
A = M//259
M = D//260
//push constant 6
@6//261
D = A//262
@SP//263
A = M//264
M = D//265
@SP//266
M = M + 1//267
//pop local 3
@3//268
D = A//269
@LCL//270
D = M + D//271
@R13//272
M = D//273
@SP//274
AM = M - 1//275
D = M//276
@R13//277
A = M//278
M = D//279
//push constant 123
@123//280
D = A//281
@SP//282
A = M//283
M = D//284
@SP//285
M = M + 1//286
//call Sys.add12 1
@RETURN3 //calling Sys.add12 with 1//287
D = A//288
@SP//289
A = M//290
M = D//291
@SP//292
M = M + 1//293
@LCL//294
D = M//295
@SP//296
A = M//297
M = D//298
@SP//299
M = M + 1//300
@ARG//301
D = M//302
@SP//303
A = M//304
M = D//305
@SP//306
M = M + 1//307
@THIS//308
D = M//309
@SP//310
A = M//311
M = D//312
@SP//313
M = M + 1//314
@THAT//315
D = M//316
@SP//317
A = M//318
M = D//319
@SP//320
M = M + 1//321
@SP//322
D = M//323
@6//324
D = D - A//325
@ARG//326
M = D//327
@SP//328
D = M//329
@LCL//330
M = D//331
@Sys.add12//332
0;JMP//333
(RETURN3)
//pop temp 0
@0//334
D = A//335
@5//336
D = A + D//337
@R13//338
M = D//339
@SP//340
AM = M - 1//341
D = M//342
@R13//343
A = M//344
M = D//345
//push local 0
@0//346
D = A//347
@LCL//348
A = M + D//349
D = M//350
@SP//351
A = M//352
M = D//353
@SP//354
M = M + 1//355
//push local 1
@1//356
D = A//357
@LCL//358
A = M + D//359
D = M//360
@SP//361
A = M//362
M = D//363
@SP//364
M = M + 1//365
//push local 2
@2//366
D = A//367
@LCL//368
A = M + D//369
D = M//370
@SP//371
A = M//372
M = D//373
@SP//374
M = M + 1//375
//push local 3
@3//376
D = A//377
@LCL//378
A = M + D//379
D = M//380
@SP//381
A = M//382
M = D//383
@SP//384
M = M + 1//385
//push local 4
@4//386
D = A//387
@LCL//388
A = M + D//389
D = M//390
@SP//391
A = M//392
M = D//393
@SP//394
M = M + 1//395
//add
@SP//396
AM = M - 1//397
D = M//398
@SP//399
AM = M - 1//400
M = D + M//401
@SP//402
M = M + 1//403
//add
@SP//404
AM = M - 1//405
D = M//406
@SP//407
AM = M - 1//408
M = D + M//409
@SP//410
M = M + 1//411
//add
@SP//412
AM = M - 1//413
D = M//414
@SP//415
AM = M - 1//416
M = D + M//417
@SP//418
M = M + 1//419
//add
@SP//420
AM = M - 1//421
D = M//422
@SP//423
AM = M - 1//424
M = D + M//425
@SP//426
M = M + 1//427
//return
@LCL//428
D = M//429
@R14//430
M = D//431
@5//432
D = A//433
@R14//434
D = M - D//435
A = D//436
D = M//437
@R15//438
M = D//439
@0//440
D = A//441
@ARG//442
D = M + D//443
@R13//444
M = D//445
@SP//446
AM = M - 1//447
D = M//448
@R13//449
A = M//450
M = D//451
@ARG//452
D = M//453
@SP//454
M = D + 1//455
@R14//456
M = M - 1//457
A = M//458
D = M//459
@THAT//460
M = D//461
@R14//462
M = M - 1//463
A = M//464
D = M//465
@THIS//466
M = D//467
@R14//468
M = M - 1//469
A = M//470
D = M//471
@ARG//472
M = D//473
@R14//474
M = M - 1//475
A = M//476
D = M//477
@LCL//478
M = D//479
@R15//480
A = M//481
0;JMP//482
//function Sys.add12 0
(Sys.add12)
//push constant 4002
@4002//483
D = A//484
@SP//485
A = M//486
M = D//487
@SP//488
M = M + 1//489
//pop pointer 0
@0//490
D = A//491
@3//492
D = A + D//493
@R13//494
M = D//495
@SP//496
AM = M - 1//497
D = M//498
@R13//499
A = M//500
M = D//501
//push constant 5002
@5002//502
D = A//503
@SP//504
A = M//505
M = D//506
@SP//507
M = M + 1//508
//pop pointer 1
@1//509
D = A//510
@3//511
D = A + D//512
@R13//513
M = D//514
@SP//515
AM = M - 1//516
D = M//517
@R13//518
A = M//519
M = D//520
//push argument 0
@0//521
D = A//522
@ARG//523
A = M + D//524
D = M//525
@SP//526
A = M//527
M = D//528
@SP//529
M = M + 1//530
//push constant 12
@12//531
D = A//532
@SP//533
A = M//534
M = D//535
@SP//536
M = M + 1//537
//add
@SP//538
AM = M - 1//539
D = M//540
@SP//541
AM = M - 1//542
M = D + M//543
@SP//544
M = M + 1//545
//return
@LCL//546
D = M//547
@R14//548
M = D//549
@5//550
D = A//551
@R14//552
D = M - D//553
A = D//554
D = M//555
@R15//556
M = D//557
@0//558
D = A//559
@ARG//560
D = M + D//561
@R13//562
M = D//563
@SP//564
AM = M - 1//565
D = M//566
@R13//567
A = M//568
M = D//569
@ARG//570
D = M//571
@SP//572
M = D + 1//573
@R14//574
M = M - 1//575
A = M//576
D = M//577
@THAT//578
M = D//579
@R14//580
M = M - 1//581
A = M//582
D = M//583
@THIS//584
M = D//585
@R14//586
M = M - 1//587
A = M//588
D = M//589
@ARG//590
M = D//591
@R14//592
M = M - 1//593
A = M//594
D = M//595
@LCL//596
M = D//597
@R15//598
A = M//599
0;JMP//600
