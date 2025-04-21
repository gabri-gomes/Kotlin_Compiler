module Instructions where

-------------------------------------------------------- Intermidiate Instructions ----------------------------------------------------------
type Temp = String
type Label = String
type Ident = String

data Instr
    = MOVEI Temp Int
    | MOVE Temp Temp
    | MOVES Temp String
    | AND Temp Temp Temp
    | OR Temp Temp Temp
    | ADD Temp Temp Temp
    | SUB Temp Temp Temp
    | MUL Temp Temp Temp
    | DIV Temp Temp Temp
    | LESS Temp Temp Temp
    | NOT Temp Temp
    | GREATER Temp Temp Temp
    | MOD Temp Temp Temp
    | EQ Temp Temp Temp
    | NEQ Temp Temp Temp
    | LEQ Temp Temp Temp
    | GEQ Temp Temp Temp
    | JUMP Label
    | LABEL Label
    | PRINT Temp
    | PRINTLN Temp
    | READ Temp
    | COND Temp Op Temp Label Label
    deriving (Show)

data Op = OpEQ | OpNEQ | OpLT | OpLE | OpGT | OpGE 
    deriving (Show, Eq)

