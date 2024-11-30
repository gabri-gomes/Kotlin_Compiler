module CodeGen (codeGen, translateExp) where

import AST
import IR
import Data.Map (Map)
import qualified Data.Map as Map
import Control.Monad.State (State)
import qualified Control.Monad.State as State
import Control.Monad (foldM)

type Table = [(Ident, Temp)]
type Supply = (Int, Int)

newTemp :: State Supply Temp
newTemp = do
    (t, l) <- State.get
    State.put (t + 1, l)
    return ("t" ++ show t)

newLabel :: State Supply Label
newLabel = do
    (t, l) <- State.get
    State.put (t, l + 1)
    return ("L" ++ show l)

getTemp :: [Instr] -> Temp
getTemp [] = error "No instructions to extract Temp from"
getTemp code = case last code of
    MOVE t _       -> t
    MOVEI t _      -> t
    MOVES t _      -> t
    ADD t _ _      -> t
    SUB t _ _      -> t
    MUL t _ _      -> t
    DIV t _ _      -> t
    LESS t _ _     -> t
    GREATER t _ _  -> t
    IR.EQ t _ _    -> t
    _              -> error "Invalid instruction to extract Temp"

translateExp :: Table -> Exp -> State Supply ([Instr], Table)
translateExp table (Num n) = do
    t <- newTemp
    return ([MOVEI t n], table)

translateExp table (Bool b) = do
    t <- newTemp
    return ([MOVEI t (if b then 1 else 0)], table)

translateExp table (Var x) =
    case lookup x table of
        Just t  -> return ([MOVE t t], table)
        Nothing -> error $ "Undefined variable: " ++ x

translateExp table (String s) = do
    t <- newTemp
    return ([MOVES t s], table)

translateExp table (Add e1 e2) = do
    (code1, table1) <- translateExp table e1
    (code2, table2) <- translateExp table1 e2
    t <- newTemp
    return (code1 ++ code2 ++ [ADD t (getTemp code1) (getTemp code2)], table2)

translateExp table (Sub e1 e2) = do
    (code1, table1) <- translateExp table e1
    (code2, table2) <- translateExp table1 e2
    t <- newTemp
    return (code1 ++ code2 ++ [SUB t (getTemp code1) (getTemp code2)], table2)

translateExp table (Mul e1 e2) = do
    (code1, table1) <- translateExp table e1
    (code2, table2) <- translateExp table1 e2
    t <- newTemp
    return (code1 ++ code2 ++ [MUL t (getTemp code1) (getTemp code2)], table2)

translateExp table (Div e1 e2) = do
    (code1, table1) <- translateExp table e1
    (code2, table2) <- translateExp table1 e2
    t <- newTemp
    return (code1 ++ code2 ++ [DIV t (getTemp code1) (getTemp code2)], table2)

translateExp table (Greater e1 e2) = do
    (code1, table1) <- translateExp table e1
    (code2, table2) <- translateExp table1 e2
    t <- newTemp
    return (code1 ++ code2 ++ [GREATER t (getTemp code1) (getTemp code2)], table2)

translateExp table (Eq e1 e2) = do
    (code1, table1) <- translateExp table e1
    (code2, table2) <- translateExp table1 e2
    t <- newTemp
    return (code1 ++ code2 ++ [IR.EQ t (getTemp code1) (getTemp code2)], table2)

translateExp table (If cond thenBranch) = do
    (condCode, table1) <- translateExp table cond
    thenLabel <- newLabel
    endLabel <- newLabel
    (thenCode, table2) <- translateExp table1 thenBranch
    return (condCode ++ [CJUMP (getTemp condCode) thenLabel] ++ [LABEL thenLabel] ++ thenCode ++ [LABEL endLabel], table2)

translateExp table (While cond body) = do
    condLabel <- newLabel
    bodyLabel <- newLabel
    endLabel <- newLabel
    (condCode, table1) <- translateExp table cond
    (bodyCode, table2) <- translateExp table1 body
    return ([LABEL condLabel] ++ condCode ++ [CJUMP (getTemp condCode) bodyLabel, JUMP endLabel, LABEL bodyLabel] ++ bodyCode ++ [JUMP condLabel, LABEL endLabel], table2)

translateExp table (Decl x e) = do
    (code, table1) <- translateExp table e
    let t = getTemp code
    let updatedTable = (x, t) : table1
    return (code, updatedTable)

translateExp table (Assign (Var x) e) = do
    (code, table1) <- translateExp table e
    case lookup x table1 of
        Just t -> return (code ++ [MOVE t (getTemp code)], table1)
        Nothing -> error $ "Undefined variable in assignment: " ++ x

translateExp table (Main body) = do
    (code, finalTable) <- translateExp table body
    return ([LABEL "main"] ++ code, finalTable)

translateExp table (Block decls body) = do
    (declCode, updatedTable) <- translateDecls table decls
    (bodyCode, finalTable) <- translateExp updatedTable (Program body)
    return (declCode ++ bodyCode, finalTable)

translateExp table (Program exps) = do
    foldM processExp ([], table) exps
  where
    processExp (accCode, accTable) exp = do
        (expCode, newTable) <- translateExp accTable exp
        return (accCode ++ expCode, newTable)

translateExp table (Print (String s)) = do
    t <- newTemp
    return ([MOVES t s, PRINT t], table)

translateExp table (Print e) = do
    (code, table1) <- translateExp table e
    return (code ++ [PRINT (getTemp code)], table1)

translateExp table (PrintLn e) = do
    (code, table1) <- translateExp table e
    return (code ++ [PRINTLN (getTemp code)], table1)

translateExp _ exp = error $ "translateExp: Unhandled case - " ++ show exp

translateDecls :: Table -> [Exp] -> State Supply ([Instr], Table)
translateDecls table [] = return ([], table)
translateDecls table (Decl x e : decls) = do
    (code, table1) <- translateExp table e
    let t = getTemp code
    let updatedTable = (x, t) : table1
    (restCode, finalTable) <- translateDecls updatedTable decls
    return (code ++ restCode, finalTable)

codeGen :: Exp -> [Instr]
codeGen exp = fst $ State.evalState (translateExp [] exp) (0, 0)
