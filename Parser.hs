{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import AST
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,310) ([0,0,0,2,0,0,2048,0,0,0,64,0,0,0,0,0,2,0,0,4096,0,0,0,128,0,0,0,0,0,0,2048,56320,257,0,0,0,0,0,1,0,0,512,30464,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,4,8192,0,0,0,128,0,0,0,2,0,0,2048,0,0,0,512,0,0,34304,50176,17920,0,536,784,256,24576,16392,12,4,8576,12544,4096,0,134,196,64,0,32,32768,0,32768,0,512,0,0,0,0,0,0,0,0,536,784,280,0,0,32768,1,8576,12544,4480,0,0,0,24,0,4,0,0,0,256,0,0,0,8,0,0,48,0,0,0,15,0,32768,1,0,0,6144,0,0,0,0,8,0,0,0,0,0,0,0,0,32768,33,49,16,34304,50176,16384,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,0,4,0,0,4096,0,0,0,0,0,0,32768,0,0,0,512,0,0,0,16,0,0,16384,0,0,0,0,0,0,0,0,0,0,8192,28672,1031,0,0,0,0,0,1,0,0,536,784,256,24576,16392,12,4,8576,12544,4096,0,134,196,64,6144,4098,3,1,2144,3136,1024,32768,33,49,16,34304,50176,16384,0,536,784,256,24576,16392,12,4,8576,12544,4096,0,134,196,64,6144,4098,3,1,8192,28672,1031,0,512,0,0,0,8,0,0,0,0,0,0,8,0,0,8192,0,0,0,2048,0,0,0,32,0,0,0,0,0,0,32,0,0,32768,0,0,0,1024,0,0,0,16,0,0,8576,12544,4096,0,134,196,64,0,4,0,0,4096,0,0,32768,33,49,16,34304,50176,16384,0,0,0,0,0,0,2,0,0,12,0,0,49152,3,0,0,3840,0,0,384,0,0,0,6,0,0,6144,0,0,0,96,0,0,0,6,0,0,6144,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,49152,4125,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Main","Block","Block_s","Stm","If_","While_","Exp","OrExp","AndExp","EqExp","RelExp","AddExp","MulExp","Term","Decl","ReadLine","num","string","\"+\"","\"-\"","\"*\"","\"/\"","\"(\"","\")\"","\"{\"","\"}\"","\"=\"","\"==\"","\"!=\"","\"<\"","\"<=\"","\">\"","\">=\"","\"!\"","\"%\"","\"||\"","\"&&\"","\"true\"","\"false\"","\"var\"","\"val\"","\"if\"","\"else\"","\"while\"","\"print\"","\"println\"","\"fun\"","\"main\"","\"readLine\"","\"readln\"","\"Int\"","\"Bool\"","\":\"","id","%eof"]
        bit_start = st * 58
        bit_end = (st + 1) * 58
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..57]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (50) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (50) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (51) = happyShift action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (58) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (26) = happyShift action_5
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (27) = happyShift action_6
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (28) = happyShift action_8
action_6 (5) = happyGoto action_7
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_1

action_8 (28) = happyShift action_8
action_8 (43) = happyShift action_16
action_8 (44) = happyShift action_17
action_8 (45) = happyShift action_18
action_8 (47) = happyShift action_19
action_8 (48) = happyShift action_20
action_8 (49) = happyShift action_21
action_8 (57) = happyShift action_22
action_8 (5) = happyGoto action_9
action_8 (6) = happyGoto action_10
action_8 (7) = happyGoto action_11
action_8 (8) = happyGoto action_12
action_8 (9) = happyGoto action_13
action_8 (18) = happyGoto action_14
action_8 (19) = happyGoto action_15
action_8 _ = happyReduce_4

action_9 _ = happyReduce_5

action_10 (29) = happyShift action_31
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (28) = happyShift action_8
action_11 (43) = happyShift action_16
action_11 (44) = happyShift action_17
action_11 (45) = happyShift action_18
action_11 (47) = happyShift action_19
action_11 (48) = happyShift action_20
action_11 (49) = happyShift action_21
action_11 (57) = happyShift action_22
action_11 (5) = happyGoto action_9
action_11 (6) = happyGoto action_30
action_11 (7) = happyGoto action_11
action_11 (8) = happyGoto action_12
action_11 (9) = happyGoto action_13
action_11 (18) = happyGoto action_14
action_11 (19) = happyGoto action_15
action_11 _ = happyReduce_4

action_12 _ = happyReduce_6

action_13 _ = happyReduce_7

action_14 _ = happyReduce_10

action_15 _ = happyReduce_12

action_16 (57) = happyShift action_29
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (57) = happyShift action_28
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (26) = happyShift action_27
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (26) = happyShift action_26
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (26) = happyShift action_25
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (26) = happyShift action_24
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (30) = happyShift action_23
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (20) = happyShift action_44
action_23 (21) = happyShift action_45
action_23 (26) = happyShift action_46
action_23 (37) = happyShift action_47
action_23 (41) = happyShift action_48
action_23 (42) = happyShift action_49
action_23 (52) = happyShift action_55
action_23 (53) = happyShift action_56
action_23 (57) = happyShift action_50
action_23 (10) = happyGoto action_54
action_23 (11) = happyGoto action_37
action_23 (12) = happyGoto action_38
action_23 (13) = happyGoto action_39
action_23 (14) = happyGoto action_40
action_23 (15) = happyGoto action_41
action_23 (16) = happyGoto action_42
action_23 (17) = happyGoto action_43
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (20) = happyShift action_44
action_24 (21) = happyShift action_45
action_24 (26) = happyShift action_46
action_24 (37) = happyShift action_47
action_24 (41) = happyShift action_48
action_24 (42) = happyShift action_49
action_24 (57) = happyShift action_50
action_24 (10) = happyGoto action_53
action_24 (11) = happyGoto action_37
action_24 (12) = happyGoto action_38
action_24 (13) = happyGoto action_39
action_24 (14) = happyGoto action_40
action_24 (15) = happyGoto action_41
action_24 (16) = happyGoto action_42
action_24 (17) = happyGoto action_43
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (20) = happyShift action_44
action_25 (21) = happyShift action_45
action_25 (26) = happyShift action_46
action_25 (37) = happyShift action_47
action_25 (41) = happyShift action_48
action_25 (42) = happyShift action_49
action_25 (57) = happyShift action_50
action_25 (10) = happyGoto action_52
action_25 (11) = happyGoto action_37
action_25 (12) = happyGoto action_38
action_25 (13) = happyGoto action_39
action_25 (14) = happyGoto action_40
action_25 (15) = happyGoto action_41
action_25 (16) = happyGoto action_42
action_25 (17) = happyGoto action_43
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (20) = happyShift action_44
action_26 (21) = happyShift action_45
action_26 (26) = happyShift action_46
action_26 (37) = happyShift action_47
action_26 (41) = happyShift action_48
action_26 (42) = happyShift action_49
action_26 (57) = happyShift action_50
action_26 (10) = happyGoto action_51
action_26 (11) = happyGoto action_37
action_26 (12) = happyGoto action_38
action_26 (13) = happyGoto action_39
action_26 (14) = happyGoto action_40
action_26 (15) = happyGoto action_41
action_26 (16) = happyGoto action_42
action_26 (17) = happyGoto action_43
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (20) = happyShift action_44
action_27 (21) = happyShift action_45
action_27 (26) = happyShift action_46
action_27 (37) = happyShift action_47
action_27 (41) = happyShift action_48
action_27 (42) = happyShift action_49
action_27 (57) = happyShift action_50
action_27 (10) = happyGoto action_36
action_27 (11) = happyGoto action_37
action_27 (12) = happyGoto action_38
action_27 (13) = happyGoto action_39
action_27 (14) = happyGoto action_40
action_27 (15) = happyGoto action_41
action_27 (16) = happyGoto action_42
action_27 (17) = happyGoto action_43
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (30) = happyShift action_34
action_28 (56) = happyShift action_35
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (30) = happyShift action_32
action_29 (56) = happyShift action_33
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_3

action_31 _ = happyReduce_2

action_32 (20) = happyShift action_44
action_32 (21) = happyShift action_45
action_32 (26) = happyShift action_46
action_32 (37) = happyShift action_47
action_32 (41) = happyShift action_48
action_32 (42) = happyShift action_49
action_32 (52) = happyShift action_86
action_32 (53) = happyShift action_87
action_32 (57) = happyShift action_50
action_32 (10) = happyGoto action_85
action_32 (11) = happyGoto action_37
action_32 (12) = happyGoto action_38
action_32 (13) = happyGoto action_39
action_32 (14) = happyGoto action_40
action_32 (15) = happyGoto action_41
action_32 (16) = happyGoto action_42
action_32 (17) = happyGoto action_43
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (54) = happyShift action_83
action_33 (55) = happyShift action_84
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (20) = happyShift action_44
action_34 (21) = happyShift action_45
action_34 (26) = happyShift action_46
action_34 (37) = happyShift action_47
action_34 (41) = happyShift action_48
action_34 (42) = happyShift action_49
action_34 (52) = happyShift action_81
action_34 (53) = happyShift action_82
action_34 (57) = happyShift action_50
action_34 (10) = happyGoto action_80
action_34 (11) = happyGoto action_37
action_34 (12) = happyGoto action_38
action_34 (13) = happyGoto action_39
action_34 (14) = happyGoto action_40
action_34 (15) = happyGoto action_41
action_34 (16) = happyGoto action_42
action_34 (17) = happyGoto action_43
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (54) = happyShift action_78
action_35 (55) = happyShift action_79
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (27) = happyShift action_77
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (39) = happyShift action_76
action_37 _ = happyReduce_16

action_38 (40) = happyShift action_75
action_38 _ = happyReduce_18

action_39 (31) = happyShift action_73
action_39 (32) = happyShift action_74
action_39 _ = happyReduce_20

action_40 (33) = happyShift action_69
action_40 (34) = happyShift action_70
action_40 (35) = happyShift action_71
action_40 (36) = happyShift action_72
action_40 _ = happyReduce_23

action_41 (22) = happyShift action_67
action_41 (23) = happyShift action_68
action_41 _ = happyReduce_28

action_42 (24) = happyShift action_65
action_42 (25) = happyShift action_66
action_42 _ = happyReduce_31

action_43 (38) = happyShift action_64
action_43 _ = happyReduce_35

action_44 _ = happyReduce_36

action_45 _ = happyReduce_42

action_46 (20) = happyShift action_44
action_46 (21) = happyShift action_45
action_46 (26) = happyShift action_46
action_46 (37) = happyShift action_47
action_46 (41) = happyShift action_48
action_46 (42) = happyShift action_49
action_46 (57) = happyShift action_50
action_46 (10) = happyGoto action_63
action_46 (11) = happyGoto action_37
action_46 (12) = happyGoto action_38
action_46 (13) = happyGoto action_39
action_46 (14) = happyGoto action_40
action_46 (15) = happyGoto action_41
action_46 (16) = happyGoto action_42
action_46 (17) = happyGoto action_43
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (20) = happyShift action_44
action_47 (21) = happyShift action_45
action_47 (26) = happyShift action_46
action_47 (37) = happyShift action_47
action_47 (41) = happyShift action_48
action_47 (42) = happyShift action_49
action_47 (57) = happyShift action_50
action_47 (17) = happyGoto action_62
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_38

action_49 _ = happyReduce_39

action_50 _ = happyReduce_37

action_51 (27) = happyShift action_61
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (27) = happyShift action_60
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (27) = happyShift action_59
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_11

action_55 (26) = happyShift action_58
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (26) = happyShift action_57
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (27) = happyShift action_113
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (27) = happyShift action_112
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_8

action_60 _ = happyReduce_9

action_61 (28) = happyShift action_8
action_61 (43) = happyShift action_16
action_61 (44) = happyShift action_17
action_61 (45) = happyShift action_18
action_61 (47) = happyShift action_19
action_61 (48) = happyShift action_20
action_61 (49) = happyShift action_21
action_61 (57) = happyShift action_22
action_61 (5) = happyGoto action_9
action_61 (7) = happyGoto action_111
action_61 (8) = happyGoto action_12
action_61 (9) = happyGoto action_13
action_61 (18) = happyGoto action_14
action_61 (19) = happyGoto action_15
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_40

action_63 (27) = happyShift action_110
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (20) = happyShift action_44
action_64 (21) = happyShift action_45
action_64 (26) = happyShift action_46
action_64 (37) = happyShift action_47
action_64 (41) = happyShift action_48
action_64 (42) = happyShift action_49
action_64 (57) = happyShift action_50
action_64 (17) = happyGoto action_109
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (20) = happyShift action_44
action_65 (21) = happyShift action_45
action_65 (26) = happyShift action_46
action_65 (37) = happyShift action_47
action_65 (41) = happyShift action_48
action_65 (42) = happyShift action_49
action_65 (57) = happyShift action_50
action_65 (17) = happyGoto action_108
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (20) = happyShift action_44
action_66 (21) = happyShift action_45
action_66 (26) = happyShift action_46
action_66 (37) = happyShift action_47
action_66 (41) = happyShift action_48
action_66 (42) = happyShift action_49
action_66 (57) = happyShift action_50
action_66 (17) = happyGoto action_107
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (20) = happyShift action_44
action_67 (21) = happyShift action_45
action_67 (26) = happyShift action_46
action_67 (37) = happyShift action_47
action_67 (41) = happyShift action_48
action_67 (42) = happyShift action_49
action_67 (57) = happyShift action_50
action_67 (16) = happyGoto action_106
action_67 (17) = happyGoto action_43
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (20) = happyShift action_44
action_68 (21) = happyShift action_45
action_68 (26) = happyShift action_46
action_68 (37) = happyShift action_47
action_68 (41) = happyShift action_48
action_68 (42) = happyShift action_49
action_68 (57) = happyShift action_50
action_68 (16) = happyGoto action_105
action_68 (17) = happyGoto action_43
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (20) = happyShift action_44
action_69 (21) = happyShift action_45
action_69 (26) = happyShift action_46
action_69 (37) = happyShift action_47
action_69 (41) = happyShift action_48
action_69 (42) = happyShift action_49
action_69 (57) = happyShift action_50
action_69 (15) = happyGoto action_104
action_69 (16) = happyGoto action_42
action_69 (17) = happyGoto action_43
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (20) = happyShift action_44
action_70 (21) = happyShift action_45
action_70 (26) = happyShift action_46
action_70 (37) = happyShift action_47
action_70 (41) = happyShift action_48
action_70 (42) = happyShift action_49
action_70 (57) = happyShift action_50
action_70 (15) = happyGoto action_103
action_70 (16) = happyGoto action_42
action_70 (17) = happyGoto action_43
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (20) = happyShift action_44
action_71 (21) = happyShift action_45
action_71 (26) = happyShift action_46
action_71 (37) = happyShift action_47
action_71 (41) = happyShift action_48
action_71 (42) = happyShift action_49
action_71 (57) = happyShift action_50
action_71 (15) = happyGoto action_102
action_71 (16) = happyGoto action_42
action_71 (17) = happyGoto action_43
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (20) = happyShift action_44
action_72 (21) = happyShift action_45
action_72 (26) = happyShift action_46
action_72 (37) = happyShift action_47
action_72 (41) = happyShift action_48
action_72 (42) = happyShift action_49
action_72 (57) = happyShift action_50
action_72 (15) = happyGoto action_101
action_72 (16) = happyGoto action_42
action_72 (17) = happyGoto action_43
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (20) = happyShift action_44
action_73 (21) = happyShift action_45
action_73 (26) = happyShift action_46
action_73 (37) = happyShift action_47
action_73 (41) = happyShift action_48
action_73 (42) = happyShift action_49
action_73 (57) = happyShift action_50
action_73 (14) = happyGoto action_100
action_73 (15) = happyGoto action_41
action_73 (16) = happyGoto action_42
action_73 (17) = happyGoto action_43
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (20) = happyShift action_44
action_74 (21) = happyShift action_45
action_74 (26) = happyShift action_46
action_74 (37) = happyShift action_47
action_74 (41) = happyShift action_48
action_74 (42) = happyShift action_49
action_74 (57) = happyShift action_50
action_74 (14) = happyGoto action_99
action_74 (15) = happyGoto action_41
action_74 (16) = happyGoto action_42
action_74 (17) = happyGoto action_43
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (20) = happyShift action_44
action_75 (21) = happyShift action_45
action_75 (26) = happyShift action_46
action_75 (37) = happyShift action_47
action_75 (41) = happyShift action_48
action_75 (42) = happyShift action_49
action_75 (57) = happyShift action_50
action_75 (13) = happyGoto action_98
action_75 (14) = happyGoto action_40
action_75 (15) = happyGoto action_41
action_75 (16) = happyGoto action_42
action_75 (17) = happyGoto action_43
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (20) = happyShift action_44
action_76 (21) = happyShift action_45
action_76 (26) = happyShift action_46
action_76 (37) = happyShift action_47
action_76 (41) = happyShift action_48
action_76 (42) = happyShift action_49
action_76 (57) = happyShift action_50
action_76 (12) = happyGoto action_97
action_76 (13) = happyGoto action_39
action_76 (14) = happyGoto action_40
action_76 (15) = happyGoto action_41
action_76 (16) = happyGoto action_42
action_76 (17) = happyGoto action_43
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (28) = happyShift action_8
action_77 (43) = happyShift action_16
action_77 (44) = happyShift action_17
action_77 (45) = happyShift action_18
action_77 (47) = happyShift action_19
action_77 (48) = happyShift action_20
action_77 (49) = happyShift action_21
action_77 (57) = happyShift action_22
action_77 (5) = happyGoto action_9
action_77 (7) = happyGoto action_96
action_77 (8) = happyGoto action_12
action_77 (9) = happyGoto action_13
action_77 (18) = happyGoto action_14
action_77 (19) = happyGoto action_15
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (30) = happyShift action_95
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (30) = happyShift action_94
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_44

action_81 (26) = happyShift action_93
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (26) = happyShift action_92
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (30) = happyShift action_91
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (30) = happyShift action_90
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_43

action_86 (26) = happyShift action_89
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (26) = happyShift action_88
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (27) = happyShift action_122
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (27) = happyShift action_121
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (20) = happyShift action_44
action_90 (21) = happyShift action_45
action_90 (26) = happyShift action_46
action_90 (37) = happyShift action_47
action_90 (41) = happyShift action_48
action_90 (42) = happyShift action_49
action_90 (57) = happyShift action_50
action_90 (10) = happyGoto action_120
action_90 (11) = happyGoto action_37
action_90 (12) = happyGoto action_38
action_90 (13) = happyGoto action_39
action_90 (14) = happyGoto action_40
action_90 (15) = happyGoto action_41
action_90 (16) = happyGoto action_42
action_90 (17) = happyGoto action_43
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (20) = happyShift action_44
action_91 (21) = happyShift action_45
action_91 (26) = happyShift action_46
action_91 (37) = happyShift action_47
action_91 (41) = happyShift action_48
action_91 (42) = happyShift action_49
action_91 (57) = happyShift action_50
action_91 (10) = happyGoto action_119
action_91 (11) = happyGoto action_37
action_91 (12) = happyGoto action_38
action_91 (13) = happyGoto action_39
action_91 (14) = happyGoto action_40
action_91 (15) = happyGoto action_41
action_91 (16) = happyGoto action_42
action_91 (17) = happyGoto action_43
action_91 _ = happyFail (happyExpListPerState 91)

action_92 (27) = happyShift action_118
action_92 _ = happyFail (happyExpListPerState 92)

action_93 (27) = happyShift action_117
action_93 _ = happyFail (happyExpListPerState 93)

action_94 (20) = happyShift action_44
action_94 (21) = happyShift action_45
action_94 (26) = happyShift action_46
action_94 (37) = happyShift action_47
action_94 (41) = happyShift action_48
action_94 (42) = happyShift action_49
action_94 (57) = happyShift action_50
action_94 (10) = happyGoto action_116
action_94 (11) = happyGoto action_37
action_94 (12) = happyGoto action_38
action_94 (13) = happyGoto action_39
action_94 (14) = happyGoto action_40
action_94 (15) = happyGoto action_41
action_94 (16) = happyGoto action_42
action_94 (17) = happyGoto action_43
action_94 _ = happyFail (happyExpListPerState 94)

action_95 (20) = happyShift action_44
action_95 (21) = happyShift action_45
action_95 (26) = happyShift action_46
action_95 (37) = happyShift action_47
action_95 (41) = happyShift action_48
action_95 (42) = happyShift action_49
action_95 (57) = happyShift action_50
action_95 (10) = happyGoto action_115
action_95 (11) = happyGoto action_37
action_95 (12) = happyGoto action_38
action_95 (13) = happyGoto action_39
action_95 (14) = happyGoto action_40
action_95 (15) = happyGoto action_41
action_95 (16) = happyGoto action_42
action_95 (17) = happyGoto action_43
action_95 _ = happyFail (happyExpListPerState 95)

action_96 (46) = happyShift action_114
action_96 _ = happyReduce_14

action_97 (40) = happyShift action_75
action_97 _ = happyReduce_17

action_98 (31) = happyShift action_73
action_98 (32) = happyShift action_74
action_98 _ = happyReduce_19

action_99 (33) = happyShift action_69
action_99 (34) = happyShift action_70
action_99 (35) = happyShift action_71
action_99 (36) = happyShift action_72
action_99 _ = happyReduce_22

action_100 (33) = happyShift action_69
action_100 (34) = happyShift action_70
action_100 (35) = happyShift action_71
action_100 (36) = happyShift action_72
action_100 _ = happyReduce_21

action_101 (22) = happyShift action_67
action_101 (23) = happyShift action_68
action_101 _ = happyReduce_27

action_102 (22) = happyShift action_67
action_102 (23) = happyShift action_68
action_102 _ = happyReduce_26

action_103 (22) = happyShift action_67
action_103 (23) = happyShift action_68
action_103 _ = happyReduce_25

action_104 (22) = happyShift action_67
action_104 (23) = happyShift action_68
action_104 _ = happyReduce_24

action_105 (24) = happyShift action_65
action_105 (25) = happyShift action_66
action_105 _ = happyReduce_30

action_106 (24) = happyShift action_65
action_106 (25) = happyShift action_66
action_106 _ = happyReduce_29

action_107 _ = happyReduce_32

action_108 _ = happyReduce_33

action_109 _ = happyReduce_34

action_110 _ = happyReduce_41

action_111 _ = happyReduce_15

action_112 _ = happyReduce_51

action_113 _ = happyReduce_54

action_114 (28) = happyShift action_8
action_114 (43) = happyShift action_16
action_114 (44) = happyShift action_17
action_114 (45) = happyShift action_18
action_114 (47) = happyShift action_19
action_114 (48) = happyShift action_20
action_114 (49) = happyShift action_21
action_114 (57) = happyShift action_22
action_114 (5) = happyGoto action_9
action_114 (7) = happyGoto action_123
action_114 (8) = happyGoto action_12
action_114 (9) = happyGoto action_13
action_114 (18) = happyGoto action_14
action_114 (19) = happyGoto action_15
action_114 _ = happyFail (happyExpListPerState 114)

action_115 _ = happyReduce_47

action_116 _ = happyReduce_48

action_117 _ = happyReduce_50

action_118 _ = happyReduce_53

action_119 _ = happyReduce_45

action_120 _ = happyReduce_46

action_121 _ = happyReduce_49

action_122 _ = happyReduce_52

action_123 _ = happyReduce_13

happyReduce_1 = happyReduce 5 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Program [Main happy_var_5]
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Block [] happy_var_2
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  6 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_2
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_0  6 happyReduction_4
happyReduction_4  =  HappyAbsSyn6
		 ([]
	)

happyReduce_5 = happySpecReduce_1  7 happyReduction_5
happyReduction_5 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  7 happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happyReduce 4 7 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (PrintLn happy_var_3
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 7 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Print happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_1  7 happyReduction_10
happyReduction_10 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  7 happyReduction_11
happyReduction_11 (HappyAbsSyn10  happy_var_3)
	_
	(HappyTerminal (TOK_ID happy_var_1))
	 =  HappyAbsSyn7
		 (Assign (Var happy_var_1) happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  7 happyReduction_12
happyReduction_12 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happyReduce 7 8 happyReduction_13
happyReduction_13 ((HappyAbsSyn7  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (IfElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 5 8 happyReduction_14
happyReduction_14 ((HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (If happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 5 9 happyReduction_15
happyReduction_15 ((HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  11 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (Or happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  11 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (And happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  12 happyReduction_20
happyReduction_20 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  13 happyReduction_21
happyReduction_21 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (Eq happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  13 happyReduction_22
happyReduction_22 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (NotEq happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  13 happyReduction_23
happyReduction_23 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  14 happyReduction_24
happyReduction_24 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (Less happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  14 happyReduction_25
happyReduction_25 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (LessEq happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (Greater happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (GreaterEq happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  15 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (Add happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  15 happyReduction_30
happyReduction_30 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  15 happyReduction_31
happyReduction_31 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  16 happyReduction_32
happyReduction_32 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Div happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  16 happyReduction_33
happyReduction_33 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn16
		 (Mul happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  16 happyReduction_34
happyReduction_34 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (Mod happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  16 happyReduction_35
happyReduction_35 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn16
		 (happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  17 happyReduction_36
happyReduction_36 (HappyTerminal (TOK_NUM happy_var_1))
	 =  HappyAbsSyn17
		 (Num happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  17 happyReduction_37
happyReduction_37 (HappyTerminal (TOK_ID happy_var_1))
	 =  HappyAbsSyn17
		 (Var happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  17 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn17
		 (Bool True
	)

happyReduce_39 = happySpecReduce_1  17 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn17
		 (Bool False
	)

happyReduce_40 = happySpecReduce_2  17 happyReduction_40
happyReduction_40 (HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (Not happy_var_2
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  17 happyReduction_41
happyReduction_41 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn17
		 (happy_var_2
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  17 happyReduction_42
happyReduction_42 (HappyTerminal (TOK_STRING happy_var_1))
	 =  HappyAbsSyn17
		 (String happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happyReduce 4 18 happyReduction_43
happyReduction_43 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Decl happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_44 = happyReduce 4 18 happyReduction_44
happyReduction_44 ((HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (Decln happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_45 = happyReduce 6 18 happyReduction_45
happyReduction_45 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (DeclI happy_var_2 happy_var_6
	) `HappyStk` happyRest

happyReduce_46 = happyReduce 6 18 happyReduction_46
happyReduction_46 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (DeclB happy_var_2 happy_var_6
	) `HappyStk` happyRest

happyReduce_47 = happyReduce 6 18 happyReduction_47
happyReduction_47 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (DeclnI happy_var_2 happy_var_6
	) `HappyStk` happyRest

happyReduce_48 = happyReduce 6 18 happyReduction_48
happyReduction_48 ((HappyAbsSyn10  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (DeclnB happy_var_2 happy_var_6
	) `HappyStk` happyRest

happyReduce_49 = happyReduce 6 19 happyReduction_49
happyReduction_49 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (ReadLine happy_var_2
	) `HappyStk` happyRest

happyReduce_50 = happyReduce 6 19 happyReduction_50
happyReduction_50 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (ReadLine happy_var_2
	) `HappyStk` happyRest

happyReduce_51 = happyReduce 5 19 happyReduction_51
happyReduction_51 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (ReadLine happy_var_1
	) `HappyStk` happyRest

happyReduce_52 = happyReduce 6 19 happyReduction_52
happyReduction_52 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (ReadLine happy_var_2
	) `HappyStk` happyRest

happyReduce_53 = happyReduce 6 19 happyReduction_53
happyReduction_53 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (ReadLine happy_var_2
	) `HappyStk` happyRest

happyReduce_54 = happyReduce 5 19 happyReduction_54
happyReduction_54 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TOK_ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (ReadLine happy_var_1
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 58 58 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TOK_NUM happy_dollar_dollar -> cont 20;
	TOK_STRING happy_dollar_dollar -> cont 21;
	TOK_PLUS -> cont 22;
	TOK_MINUS -> cont 23;
	TOK_MULT -> cont 24;
	TOK_DIV -> cont 25;
	TOK_LPAREN -> cont 26;
	TOK_RPAREN -> cont 27;
	TOK_LBRACE -> cont 28;
	TOK_RBRACE -> cont 29;
	TOK_DEF -> cont 30;
	TOK_EQ -> cont 31;
	TOK_NOTEQ -> cont 32;
	TOK_LESS -> cont 33;
	TOK_LESSEQ -> cont 34;
	TOK_GREATER -> cont 35;
	TOK_GREATEREQ -> cont 36;
	TOK_NOT -> cont 37;
	TOK_MOD -> cont 38;
	TOK_OR -> cont 39;
	TOK_AND -> cont 40;
	TOK_TRUE -> cont 41;
	TOK_FALSE -> cont 42;
	TOK_VAR -> cont 43;
	TOK_VAL -> cont 44;
	TOK_IF -> cont 45;
	TOK_ELSE -> cont 46;
	TOK_WHILE -> cont 47;
	TOK_PRINT -> cont 48;
	TOK_PRINTLN -> cont 49;
	TOK_FUN -> cont 50;
	TOK_MAIN -> cont 51;
	TOK_READLN -> cont 52;
	TOK_READLN -> cont 53;
	TOK_INT -> cont 54;
	TOK_BOOL -> cont 55;
	TOK_DPOINT -> cont 56;
	TOK_ID happy_dollar_dollar -> cont 57;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 58 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError toks = error "parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
