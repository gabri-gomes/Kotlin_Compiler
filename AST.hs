module AST where

data Exp
     -- Literais e Variáveis
    = Num Int
    | Bool Bool
    | String String
    | Var String 
    

    -- Operações Aritméticas
    | Add Exp Exp
    | Sub Exp Exp 
    | Mul Exp Exp 
    | Div Exp Exp 
    | Mod Exp Exp         

    -- Blocos e Programas
    | Main Exp 
    | Program [Exp]
    | Block [Exp] [Exp]

    -- Declarações e Atribuições
    | Decl String Exp
    | Decln String Exp
    | DeclnI String Exp 
    | DeclnB String Exp  
    | DeclI String Exp
    | DeclB String Exp
    | Assign Exp Exp

    -- If Else While
    | If Exp Exp
    | IfElse Exp Exp Exp
    | While Exp Exp

    -- Comparações
    | Eq Exp Exp
    | NotEq Exp Exp
    | Less Exp Exp
    | LessEq Exp Exp
    | Greater Exp Exp
    | GreaterEq Exp Exp
    | Or Exp Exp
    | And Exp Exp
    | Not Exp

     -- Entrada e Saída
    | Print Exp
    | PrintLn Exp
    | ReadLine String   

    deriving (Show)
