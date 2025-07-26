module Intermediate where

import           AST
import           Instructions
import           Data.Map (Map)
import qualified Data.Map as Map
import           Control.Monad.State (State)
import Control.Monad.State (modify)
import qualified Control.Monad.State as State


----------------------------------------------------------- ** Definições de Tipos e Estruturas ** -----------------------------------------------------------



data Type = TyInt | TyBool | TyString
    deriving (Eq, Show)

data ValVar = Mutable | Immutable

-- Tabela de símbolos com o temporário e o tipo guardado 
type Table = [(String, (Temp, Type, ValVar ))]

-- Gerador de temporários e labels
type Supply = (Int, Int)


---------------------------------------------------------------- ** Geradores de Temporários e Labels ** -------------------------------------------------------------


-- Geração de um novo temporário
newTemp :: State Supply Temp
newTemp = do
    (temps, labels) <- State.get
    State.put (temps + 1, labels)
    return ("t" ++ show temps)

-- Geração de um novo label
newLabel :: State Supply Label
newLabel = do
    (temps, labels) <- State.get
    State.put (temps, labels + 1)
    return ("L" ++ show labels)

getTempFromCode :: [Instr] -> Temp
getTempFromCode [] = error "No instructions to extract temp"
getTempFromCode (instr:rest) = 
    case rest of
        [] -> extractTemp instr  
        _  -> getTempFromCode rest 
  where
    extractTemp :: Instr -> Temp
    extractTemp (MOVE temp _)   = temp
    extractTemp (MOVEI temp _)  = temp
    extractTemp (ADD temp _ _)  = temp
    extractTemp (SUB temp _ _)  = temp
    extractTemp (MUL temp _ _)  = temp
    extractTemp (DIV temp _ _)  = temp
    extractTemp (MOD temp _ _)  = temp
    extractTemp _ = error "No valid instruction to extract temp"


popTemps :: Int -> State Supply ()
popTemps n = modify (\(temps, labels) -> (temps - n, labels))


------------------------------------------------------------------ ** Verificação de Tipos ** ----------------------------------------------------------------


-- Verificação de tipos
checkType :: Table -> Exp -> Type
checkType _ (Num _) = TyInt
checkType _ (Bool _) = TyBool
checkType _ (String _) = TyString
checkType table (Var x) =
    case lookup x table of
        Just (_, ty, _) -> ty
        Nothing -> error $ "Undefined variable: " ++ x
checkType table (Add e1 e2) = checkArithmetic table e1 e2
checkType table (Sub e1 e2) = checkArithmetic table e1 e2
checkType table (Mul e1 e2) = checkArithmetic table e1 e2
checkType table (Div e1 e2) = checkArithmetic table e1 e2
checkType table (Mod e1 e2) = checkArithmetic table e1 e2
checkType table (Eq e1 e2) = checkComparison table e1 e2
checkType table (NotEq e1 e2) = checkComparison table e1 e2
checkType table (Less e1 e2) = checkComparison table e1 e2
checkType table (LessEq e1 e2) = checkComparison table e1 e2
checkType table (Greater e1 e2) = checkComparison table e1 e2
checkType table (GreaterEq e1 e2) = checkComparison table e1 e2
checkType table (Or e1 e2) = checkBoolean table e1 e2
checkType table (And e1 e2) = checkBoolean table e1 e2
checkType table (Not e) =
    let t = checkType table e
    in if t == TyBool then TyBool else error "Type error in Not expression"

checkType table (Decl _ e) = checkType table e

checkType table (Assign (Var x) e) =
    let varType = case lookup x table of
            Just (_, ty, _) -> ty
            Nothing -> error $ "Undefined variable: " ++ x
        exprType = checkType table e
    in if varType == exprType
       then varType
       else error $ "Type mismatch in assignment to variable: " ++ x

checkType table (If cond _) =
    if checkType table cond == TyBool
    then TyBool
    else error "Condition in If must be of type Bool"

checkType table (IfElse cond _ _) =
    if checkType table cond == TyBool
    then TyBool
    else error "Condition in IfElse must be of type Bool"

checkType table (While cond _) =
    if checkType table cond == TyBool
    then TyBool
    else error "Condition in While must be of type Bool"
checkType table (Print e) = checkType table e
checkType table (PrintLn e) = checkType table e
checkType _ (ReadLine _) = TyString
checkType _ _ = error "Unsupported expression"

checkArithmetic :: Table -> Exp -> Exp -> Type
checkArithmetic table e1 e2 =
    let t1 = checkType table e1
        t2 = checkType table e2
    in if t1 == TyInt && t2 == TyInt
       then TyInt
       else error $ "Type error in arithmetic expression: " ++ show e1 ++ " and " ++ show e2


checkComparison :: Table -> Exp -> Exp -> Type
checkComparison table e1 e2 =
    let t1 = checkType table e1
        t2 = checkType table e2
    in if t1 == t2 && (t1 == TyInt || t1 == TyBool || t1 == TyString)
       then TyBool
       else if t1 /= t2
            then error $ "Type mismatch in comparison: Cannot compare " ++ show t1 ++ " with " ++ show t2
            else error $ "Type error in comparison: " ++ show e1 ++ " and " ++ show e2


checkBoolean :: Table -> Exp -> Exp -> Type
checkBoolean table e1 e2 =
    if checkType table e1 == TyBool && checkType table e2 == TyBool
    then TyBool
    else error "Type error in boolean expression"


-------------------------------------------------------------- ** Tradução de Expressões para Instructions ** ------------------------------------------------------


-- Tradução de expressões
translateExp :: Exp -> Table -> Temp -> State Supply [Instr]
translateExp (Num n) _ dest = return [MOVEI dest n]
translateExp (String s) _ dest = return [MOVES dest s]
translateExp (Bool b) _ dest = return [MOVEI dest (if b then 1 else 0)]
translateExp (Var x) table dest =
    case lookup x table of
        Just (temp, _, _) -> return [MOVE dest temp]
        Nothing -> error $ "Need to declare variable: " ++ x


translateExp (Add e1 e2) table dest = do
    let t1 = checkType table e1
        t2 = checkType table e2
    if t1 == TyInt && t2 == TyInt
        then translateBinary ADD e1 e2 table dest
        else error " This operation (+) requires integers  "

translateExp (Sub e1 e2) table dest = do
    let t1 = checkType table e1
        t2 = checkType table e2
    if t1 == TyInt && t2 == TyInt
        then translateBinary SUB e1 e2 table dest
        else error " This operation (-) requires integers"

translateExp (Mul e1 e2) table dest = do
    let t1 = checkType table e1
        t2 = checkType table e2
    if t1 == TyInt && t2 == TyInt
        then translateBinary MUL e1 e2 table dest
        else error " This operation (*) requires integers"

translateExp (Div e1 e2) table dest = do
    let t1 = checkType table e1
        t2 = checkType table e2
    if t1 == TyInt && t2 == TyInt
        then translateBinary DIV e1 e2 table dest
        else error " This operation (/) requires integers"


translateExp (Mod e1 e2) table dest = do
    let t1 = checkType table e1
        t2 = checkType table e2
    if t1 == TyInt && t2 == TyInt
        then translateBinary MOD e1 e2 table dest
        else error " This operation (%) requires integers"


translateExp _ _ _ = error "Unfamiliar expression by translateExp"



translateBinary :: (Temp -> Temp -> Temp -> Instr) -> Exp -> Exp -> Table -> Temp -> State Supply [Instr]
translateBinary op e1 e2 table dest = do
    temp1 <- newTemp
    temp2 <- newTemp
    code1 <- translateExp e1 table temp1
    code2 <- translateExp e2 table temp2
    popTemps 2
    return (code1 ++ code2 ++ [op dest temp1 temp2])



-------------------------------------------------- ** Tradução de Instruções (Statements) para Instructions ** -----------------------------------------------------




translateStm :: Exp -> Table -> State Supply [Instr]
translateStm (Decl var expr) table = do
    temp <- newTemp
    code <- translateExp expr table temp
    let updatedTable = (var, (temp, checkType table expr, Mutable)) : table
    return code

translateStm (Decln var expr) table = do
    temp <- newTemp
    code <- translateExp expr table temp
    let updatedTable = (var, (temp, checkType table expr, Immutable)) : table
    return code


translateStm (DeclI var expr) table = do
    let exprType = checkType table expr
    if exprType == TyInt
        then do
            temp <- newTemp
            code <- translateExp expr table temp
            let updatedTable = (var, (temp, TyInt, Mutable)) : table
            return code
        else error $ "Type mismatch: Variable " ++ var ++ " is declared as Int but assigned " ++ show exprType


translateStm (DeclB var expr) table = do
    let exprType = checkType table expr
    if exprType == TyBool
        then do
            temp <- newTemp
            code <- translateExp expr table temp
            let updatedTable = (var, (temp, TyBool, Mutable)) : table
            return code
        else error $ "Type mismatch: Variable " ++ var ++ " is declared as Bool but assigned " ++ show exprType

translateStm (DeclnI var expr) table = do
    let exprType = checkType table expr
    if exprType == TyInt
        then do
            temp <- newTemp
            code <- translateExp expr table temp
            let updatedTable = (var, (temp, TyInt, Immutable)) : table
            return code
        else error $ "Type mismatch: Variable " ++ var ++ " is declared as Int but assigned " ++ show exprType

translateStm (DeclnB var expr) table = do
    let exprType = checkType table expr
    if exprType == TyBool
        then do
            temp <- newTemp
            code <- translateExp expr table temp
            let updatedTable = (var, (temp, TyBool, Immutable)) : table
            return code
        else error $ "Type mismatch: Variable " ++ var ++ " is declared as Bool but assigned " ++ show exprType


translateStm (Assign (Var x) expr) table = do
    case lookup x table of
        Just (temp, ty, Mutable) -> do
            let exprType = checkType table expr
            if ty == exprType
                then translateExp expr table temp
                else error $ "Type mismatch in assignment to variable " ++ x
        Just (_, _, Immutable) ->
            error $ "Cannot assign to immutable variable (val): " ++ x
        Nothing -> error $ "Variable " ++ x ++ " is not declared"



translateStm (If cond thenBlock) table = do
    firstlabel <- newLabel
    secondlabel <- newLabel
    codeCond <- translateCond cond table firstlabel secondlabel
    codeThen <- translateStm thenBlock table
    return (codeCond ++ [LABEL firstlabel] ++ codeThen ++ [LABEL secondlabel])

translateStm (While cond body) table = do
    let condType = checkType table cond
    if condType /= TyBool
       then error " Conditions in While has to be type Bool"
       else do
           condlabel <- newLabel
           bodylabel <- newLabel
           endlabel <- newLabel
           codeCond <- translateCond cond table bodylabel endlabel
           codeBody <- translateStm body table
           return ([LABEL condlabel] ++ codeCond ++ [LABEL bodylabel] ++ codeBody ++ [JUMP condlabel, LABEL endlabel])


translateStm (IfElse cond thenBlock elseBlock) table = do
    firstlabel <- newLabel
    secondlabel <- newLabel
    endlabel <- newLabel
    codeCond <- translateCond cond table firstlabel secondlabel
    codeThen <- translateStm thenBlock table
    codeElse <- translateStm elseBlock table
    return (codeCond ++ [LABEL firstlabel] ++ codeThen ++ [JUMP endlabel, LABEL secondlabel] ++ codeElse ++ [LABEL endlabel])

translateStm (Print expr) table = do
    temp <- newTemp
    code <- translateExp expr table temp
    return (code ++ [PRINT temp])


translateStm (PrintLn expr) table = do
    temp <- newTemp
    code <- translateExp expr table temp
    return (code ++ [PRINTLN temp])

translateStm (ReadLine expr) table = do
    case lookup expr table of
        Just (temp, TyInt, Mutable) -> return [READ temp]
        _ -> error $ "Undefined variable or unsupported type for ReadLine: " ++ expr


translateStm (Block decls stmts) table = do
    codeDecls <- translateStmList decls table
    codeStmts <- translateStmList stmts table
    return (codeDecls ++ codeStmts)



translateStm (Main body) table = translateStm body table  
translateStm _ _ = error " Unfamiliar statement"





----------------------------------------------- ** Tradução de Condições para Instructions ** ----------------------------------------------------------------------





translateCond :: Exp -> Table -> Label -> Label -> State Supply [Instr]

translateCond (And cond1 cond2) table firstlabel secondlabel = do
    let t1 = checkType table cond1
        t2 = checkType table cond2
    if t1 == TyBool && t2 == TyBool
        then do
            midLabel <- newLabel
            code1 <- translateCond cond1 table midLabel secondlabel
            code2 <- translateCond cond2 table firstlabel secondlabel
            return (code1 ++ [LABEL midLabel] ++ code2)
        else error " This operation (&&) requires boolean exp"


translateCond (Or cond1 cond2) table firstlabel secondlabel = do
    let t1 = checkType table cond1
        t2 = checkType table cond2
    if t1 == TyBool && t2 == TyBool
        then do
            midLabel <- newLabel
            code1 <- translateCond cond1 table firstlabel midLabel
            code2 <- translateCond cond2 table firstlabel secondlabel
            return (code1 ++ [LABEL midLabel] ++ code2)
        else error " This operation (||) requires boolean exp"


translateCond (Not cond) table firstlabel secondlabel = do

      let t1 = checkType table cond

      if t1 == TyBool
        then do 
          translateCond cond table secondlabel firstlabel
        else error " This operation (!) requires boolean exp"

translateCond (Var cond) table firstlabel secondlabel = do
    case lookup cond table of
        Just (temp, TyBool, _) -> return [COND temp OpEQ "1" firstlabel secondlabel]
        _ -> error "Undefined variable or incorrect type in condition"



translateCond (Eq e1 e2) table firstlabel secondlabel = do
    let t1 = checkType table e1
        t2 = checkType table e2
    if t1 == t2 
        then do
            temp1 <- newTemp
            temp2 <- newTemp
            code1 <- translateExp e1 table temp1
            code2 <- translateExp e2 table temp2
            return (code1 ++ code2 ++ [COND temp1 OpEQ temp2 firstlabel secondlabel])
        else error $ "Type mismatch in comparison: Cannot compare " ++ show t1 ++ " with " ++ show t2

translateCond (NotEq e1 e2) table firstlabel secondlabel = do
    let t1 = checkType table e1
        t2 = checkType table e2
    if t1 == t2 
        then do
            temp1 <- newTemp
            temp2 <- newTemp
            code1 <- translateExp e1 table temp1
            code2 <- translateExp e2 table temp2
            return (code1 ++ code2 ++ [COND temp1 OpNEQ temp2 firstlabel secondlabel])
        else error $ "Type mismatch in comparison: Cannot compare " ++ show t1 ++ " with " ++ show t2

translateCond (Greater e1 e2) table firstlabel secondlabel = do
    let t1 = checkType table e1
        t2 = checkType table e2
    if t1 == t2 && t1 == TyInt
        then do
            temp1 <- newTemp
            temp2 <- newTemp
            code1 <- translateExp e1 table temp1
            code2 <- translateExp e2 table temp2
            return (code1 ++ code2 ++ [COND temp1 OpGT temp2 firstlabel secondlabel])
        else error $ "Type mismatch in comparison: Cannot compare " ++ show t1 ++ " with " ++ show t2

translateCond (GreaterEq e1 e2) table firstlabel secondlabel = do
    let t1 = checkType table e1
        t2 = checkType table e2
    if t1 == t2 && t1 == TyInt
        then do
            temp1 <- newTemp
            temp2 <- newTemp
            code1 <- translateExp e1 table temp1
            code2 <- translateExp e2 table temp2
            return (code1 ++ code2 ++ [COND temp1 OpGE temp2 firstlabel secondlabel])
        else error $ "Type mismatch in comparison: Cannot compare " ++ show t1 ++ " with " ++ show t2

translateCond (Less e1 e2) table firstlabel secondlabel = do
    let t1 = checkType table e1
        t2 = checkType table e2
    if t1 == t2 && t1 == TyInt
        then do
            temp1 <- newTemp
            temp2 <- newTemp
            code1 <- translateExp e1 table temp1
            code2 <- translateExp e2 table temp2
            return (code1 ++ code2 ++ [COND temp1 OpLT temp2 firstlabel secondlabel])
        else error $ "Type mismatch in comparison: Cannot compare " ++ show t1 ++ " with " ++ show t2

translateCond (LessEq e1 e2) table firstlabel secondlabel = do
    let t1 = checkType table e1
        t2 = checkType table e2
    if t1 == t2 && t1 == TyInt
        then do
            temp1 <- newTemp
            temp2 <- newTemp
            code1 <- translateExp e1 table temp1
            code2 <- translateExp e2 table temp2
            return (code1 ++ code2 ++ [COND temp1 OpLE temp2 firstlabel secondlabel])
        else error $ "Type mismatch in comparison: Cannot compare " ++ show t1 ++ " with " ++ show t2

translateCond _ _ _ _ = error "Unfamiliar condition"


------------------------------------------ ** Tradução de Listas de Instruções (Statements) para Instructions ** ---------------------------------------




translateStmList :: [Exp] -> Table -> State Supply [Instr]
translateStmList [] _ = return []
translateStmList (stm:rest) table = do
    code1 <- translateStm stm table
    let updatedTable = case stm of
            Decl var expr ->
                (var, (getTempFromCode code1, checkType table expr, Mutable)) : table
            Decln var expr ->
                (var, (getTempFromCode code1, checkType table expr, Immutable)) : table
            DeclI var expr ->
                if checkType table expr == TyInt
                    then (var, (getTempFromCode code1, TyInt, Mutable)) : table
                    else error $ "Type mismatch: Variable " ++ var ++ " is declared as Int but assigned a non-Int value"
            DeclB var expr ->
                if checkType table expr == TyBool
                    then (var, (getTempFromCode code1, TyBool, Mutable)) : table
                    else error $ "Type mismatch: Variable " ++ var ++ " is declared as Bool but assigned a non-Bool value"
            DeclnI var expr ->
                if checkType table expr == TyInt
                    then (var, (getTempFromCode code1, TyInt, Immutable)) : table
                    else error $ "Type mismatch: Variable " ++ var ++ " is declared as Int but assigned a non-Int value"
            DeclnB var expr ->
                if checkType table expr == TyBool
                    then (var, (getTempFromCode code1, TyBool, Immutable)) : table
                    else error $ "Type mismatch: Variable " ++ var ++ " is declared as Bool but assigned a non-Bool value"
            _ -> table
    code2 <- translateStmList rest updatedTable
    return (code1 ++ code2)


---------------------------------------- ** Tradução do Programa ** ----------------------------------------------------------------


translateProg :: Exp -> State Supply [Instr]
translateProg (Program exps) = do
    instrs <- translateStmList exps []
    return ([LABEL "main"] ++ instrs) 
translateProg _ = error "Invalid input: Expected a Program node"