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
//function Class1.set 0
(Class1.set)
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
//pop static 0
@SP//61
AM = M - 1//62
D = M//63
@StaticsTest.0//64
M = D//65
//push argument 1
@1//66
D = A//67
@ARG//68
A = M + D//69
D = M//70
@SP//71
A = M//72
M = D//73
@SP//74
M = M + 1//75
//pop static 1
@SP//76
AM = M - 1//77
D = M//78
@StaticsTest.1//79
M = D//80
//push constant 0
@0//81
D = A//82
@SP//83
A = M//84
M = D//85
@SP//86
M = M + 1//87
//return
@LCL//88
D = M//89
@R14//90
M = D//91
@5//92
D = A//93
@R14//94
D = M - D//95
A = D//96
D = M//97
@R15//98
M = D//99
@0//100
D = A//101
@ARG//102
D = M + D//103
@R13//104
M = D//105
@SP//106
AM = M - 1//107
D = M//108
@R13//109
A = M//110
M = D//111
@ARG//112
D = M//113
@SP//114
M = D + 1//115
@R14//116
M = M - 1//117
A = M//118
D = M//119
@THAT//120
M = D//121
@R14//122
M = M - 1//123
A = M//124
D = M//125
@THIS//126
M = D//127
@R14//128
M = M - 1//129
A = M//130
D = M//131
@ARG//132
M = D//133
@R14//134
M = M - 1//135
A = M//136
D = M//137
@LCL//138
M = D//139
@R15//140
A = M//141
0;JMP//142
//function Class1.get 0
(Class1.get)
//push static 0
@StaticsTest.0//143
D = M//144
@SP//145
A = M//146
M = D//147
@SP//148
M = M + 1//149
//push static 1
@StaticsTest.1//150
D = M//151
@SP//152
A = M//153
M = D//154
@SP//155
M = M + 1//156
//sub
@SP//157
AM = M - 1//158
D = M//159
@SP//160
AM = M - 1//161
M = M - D//162
@SP//163
M = M + 1//164
//return
@LCL//165
D = M//166
@R14//167
M = D//168
@5//169
D = A//170
@R14//171
D = M - D//172
A = D//173
D = M//174
@R15//175
M = D//176
@0//177
D = A//178
@ARG//179
D = M + D//180
@R13//181
M = D//182
@SP//183
AM = M - 1//184
D = M//185
@R13//186
A = M//187
M = D//188
@ARG//189
D = M//190
@SP//191
M = D + 1//192
@R14//193
M = M - 1//194
A = M//195
D = M//196
@THAT//197
M = D//198
@R14//199
M = M - 1//200
A = M//201
D = M//202
@THIS//203
M = D//204
@R14//205
M = M - 1//206
A = M//207
D = M//208
@ARG//209
M = D//210
@R14//211
M = M - 1//212
A = M//213
D = M//214
@LCL//215
M = D//216
@R15//217
A = M//218
0;JMP//219
//function Class2.set 0
(Class2.set)
//push argument 0
@0//220
D = A//221
@ARG//222
A = M + D//223
D = M//224
@SP//225
A = M//226
M = D//227
@SP//228
M = M + 1//229
//pop static 0
@SP//230
AM = M - 1//231
D = M//232
@StaticsTest.0//233
M = D//234
//push argument 1
@1//235
D = A//236
@ARG//237
A = M + D//238
D = M//239
@SP//240
A = M//241
M = D//242
@SP//243
M = M + 1//244
//pop static 1
@SP//245
AM = M - 1//246
D = M//247
@StaticsTest.1//248
M = D//249
//push constant 0
@0//250
D = A//251
@SP//252
A = M//253
M = D//254
@SP//255
M = M + 1//256
//return
@LCL//257
D = M//258
@R14//259
M = D//260
@5//261
D = A//262
@R14//263
D = M - D//264
A = D//265
D = M//266
@R15//267
M = D//268
@0//269
D = A//270
@ARG//271
D = M + D//272
@R13//273
M = D//274
@SP//275
AM = M - 1//276
D = M//277
@R13//278
A = M//279
M = D//280
@ARG//281
D = M//282
@SP//283
M = D + 1//284
@R14//285
M = M - 1//286
A = M//287
D = M//288
@THAT//289
M = D//290
@R14//291
M = M - 1//292
A = M//293
D = M//294
@THIS//295
M = D//296
@R14//297
M = M - 1//298
A = M//299
D = M//300
@ARG//301
M = D//302
@R14//303
M = M - 1//304
A = M//305
D = M//306
@LCL//307
M = D//308
@R15//309
A = M//310
0;JMP//311
//function Class2.get 0
(Class2.get)
//push static 0
@StaticsTest.0//312
D = M//313
@SP//314
A = M//315
M = D//316
@SP//317
M = M + 1//318
//push static 1
@StaticsTest.1//319
D = M//320
@SP//321
A = M//322
M = D//323
@SP//324
M = M + 1//325
//sub
@SP//326
AM = M - 1//327
D = M//328
@SP//329
AM = M - 1//330
M = M - D//331
@SP//332
M = M + 1//333
//return
@LCL//334
D = M//335
@R14//336
M = D//337
@5//338
D = A//339
@R14//340
D = M - D//341
A = D//342
D = M//343
@R15//344
M = D//345
@0//346
D = A//347
@ARG//348
D = M + D//349
@R13//350
M = D//351
@SP//352
AM = M - 1//353
D = M//354
@R13//355
A = M//356
M = D//357
@ARG//358
D = M//359
@SP//360
M = D + 1//361
@R14//362
M = M - 1//363
A = M//364
D = M//365
@THAT//366
M = D//367
@R14//368
M = M - 1//369
A = M//370
D = M//371
@THIS//372
M = D//373
@R14//374
M = M - 1//375
A = M//376
D = M//377
@ARG//378
M = D//379
@R14//380
M = M - 1//381
A = M//382
D = M//383
@LCL//384
M = D//385
@R15//386
A = M//387
0;JMP//388
//function Sys.init 0
(Sys.init)
//push constant 6
@6//389
D = A//390
@SP//391
A = M//392
M = D//393
@SP//394
M = M + 1//395
//push constant 8
@8//396
D = A//397
@SP//398
A = M//399
M = D//400
@SP//401
M = M + 1//402
//call Class1.set 2
@RETURN2 //calling Class1.set with 2//403
D = A//404
@SP//405
A = M//406
M = D//407
@SP//408
M = M + 1//409
@LCL//410
D = M//411
@SP//412
A = M//413
M = D//414
@SP//415
M = M + 1//416
@ARG//417
D = M//418
@SP//419
A = M//420
M = D//421
@SP//422
M = M + 1//423
@THIS//424
D = M//425
@SP//426
A = M//427
M = D//428
@SP//429
M = M + 1//430
@THAT//431
D = M//432
@SP//433
A = M//434
M = D//435
@SP//436
M = M + 1//437
@SP//438
D = M//439
@7//440
D = D - A//441
@ARG//442
M = D//443
@SP//444
D = M//445
@LCL//446
M = D//447
@Class1.set//448
0;JMP//449
(RETURN2)
//pop temp 0
@0//450
D = A//451
@5//452
D = A + D//453
@R13//454
M = D//455
@SP//456
AM = M - 1//457
D = M//458
@R13//459
A = M//460
M = D//461
//push constant 23
@23//462
D = A//463
@SP//464
A = M//465
M = D//466
@SP//467
M = M + 1//468
//push constant 15
@15//469
D = A//470
@SP//471
A = M//472
M = D//473
@SP//474
M = M + 1//475
//call Class2.set 2
@RETURN3 //calling Class2.set with 2//476
D = A//477
@SP//478
A = M//479
M = D//480
@SP//481
M = M + 1//482
@LCL//483
D = M//484
@SP//485
A = M//486
M = D//487
@SP//488
M = M + 1//489
@ARG//490
D = M//491
@SP//492
A = M//493
M = D//494
@SP//495
M = M + 1//496
@THIS//497
D = M//498
@SP//499
A = M//500
M = D//501
@SP//502
M = M + 1//503
@THAT//504
D = M//505
@SP//506
A = M//507
M = D//508
@SP//509
M = M + 1//510
@SP//511
D = M//512
@7//513
D = D - A//514
@ARG//515
M = D//516
@SP//517
D = M//518
@LCL//519
M = D//520
@Class2.set//521
0;JMP//522
(RETURN3)
//pop temp 0
@0//523
D = A//524
@5//525
D = A + D//526
@R13//527
M = D//528
@SP//529
AM = M - 1//530
D = M//531
@R13//532
A = M//533
M = D//534
//call Class1.get 0
@RETURN4 //calling Class1.get with 0//535
D = A//536
@SP//537
A = M//538
M = D//539
@SP//540
M = M + 1//541
@LCL//542
D = M//543
@SP//544
A = M//545
M = D//546
@SP//547
M = M + 1//548
@ARG//549
D = M//550
@SP//551
A = M//552
M = D//553
@SP//554
M = M + 1//555
@THIS//556
D = M//557
@SP//558
A = M//559
M = D//560
@SP//561
M = M + 1//562
@THAT//563
D = M//564
@SP//565
A = M//566
M = D//567
@SP//568
M = M + 1//569
@SP//570
D = M//571
@5//572
D = D - A//573
@ARG//574
M = D//575
@SP//576
D = M//577
@LCL//578
M = D//579
@Class1.get//580
0;JMP//581
(RETURN4)
//call Class2.get 0
@RETURN5 //calling Class2.get with 0//582
D = A//583
@SP//584
A = M//585
M = D//586
@SP//587
M = M + 1//588
@LCL//589
D = M//590
@SP//591
A = M//592
M = D//593
@SP//594
M = M + 1//595
@ARG//596
D = M//597
@SP//598
A = M//599
M = D//600
@SP//601
M = M + 1//602
@THIS//603
D = M//604
@SP//605
A = M//606
M = D//607
@SP//608
M = M + 1//609
@THAT//610
D = M//611
@SP//612
A = M//613
M = D//614
@SP//615
M = M + 1//616
@SP//617
D = M//618
@5//619
D = D - A//620
@ARG//621
M = D//622
@SP//623
D = M//624
@LCL//625
M = D//626
@Class2.get//627
0;JMP//628
(RETURN5)
//label WHILE
(WHILE)
//goto WHILE
@WHILE//629
0;JMP//630
