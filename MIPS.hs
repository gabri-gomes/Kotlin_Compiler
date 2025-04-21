module MIPS where 

import Intermediate
import Instructions

---------------------------------------------------------------------Mips Instructions-----------------------------------------------

mipsList :: [Instr] -> [String]
mipsList instrs = concatMap instrToMIPS instrs
  where
    instrToMIPS :: Instr -> [String]
    instrToMIPS (LABEL lbl) = [lbl ++ ":"]
    instrToMIPS (MOVEI temp val) = ["li $" ++ temp ++ ", " ++ show val]
    instrToMIPS (ADD dest src1 src2) = ["add $" ++ dest ++ ", $" ++ src1 ++ ", $" ++ src2]
    instrToMIPS (SUB dest src1 src2) = ["sub $" ++ dest ++ ", $" ++ src1 ++ ", $" ++ src2]
    instrToMIPS (DIV dest src1 src2) =["div $" ++ src1 ++ ", $" ++ src2,"mflo $" ++ dest]
    instrToMIPS (MUL dest src1 src2) =["mul $" ++ dest ++ ", $" ++ src1 ++ ", $" ++ src2]
    instrToMIPS (MOD dest src1 src2) = ["div $" ++ src1 ++ ", $" ++ src2,"mfhi $" ++ dest]                 
    instrToMIPS (MOVE dest src)
        | dest /= src = ["move $" ++ dest ++ ", $" ++ src]
    instrToMIPS (COND t1 op t2 lbl1 lbl2) =
        case op of
            OpEQ ->
                if t2 == "1"
                then ["bne $" ++ t1 ++ ", $zero, " ++ lbl1, "j " ++ lbl2]
                else if t2 == "0"
                then ["beq $" ++ t1 ++ ", $zero, " ++ lbl2, "j " ++ lbl1]
                else ["beq $" ++ t1 ++ ", $" ++ t2 ++ ", " ++ lbl1, "j " ++ lbl2]
            OpNEQ -> ["bne $" ++ t1 ++ ", $" ++ t2 ++ ", " ++ lbl1, "j " ++ lbl2]
            OpLT  -> ["blt $" ++ t1 ++ ", $" ++ t2 ++ ", " ++ lbl1, "j " ++ lbl2]
            OpLE  -> ["ble $" ++ t1 ++ ", $" ++ t2 ++ ", " ++ lbl1, "j " ++ lbl2]
            OpGT  -> ["bgt $" ++ t1 ++ ", $" ++ t2 ++ ", " ++ lbl1, "j " ++ lbl2]
            OpGE  -> ["bge $" ++ t1 ++ ", $" ++ t2 ++ ", " ++ lbl1, "j " ++ lbl2]
    instrToMIPS (PRINT temp) =
        ["li $v0, 1", "move $a0, $" ++ temp, "syscall"]
    instrToMIPS (PRINTLN temp) =
        ["li $v0, 1", "move $a0, $" ++ temp, "syscall", "li $a0, 10", "li $v0, 11", "syscall"]
    instrToMIPS (READ temp) =
        ["li $v0, 5", "syscall", "move $" ++ temp ++ ", $v0"]
    instrToMIPS (JUMP lbl) = ["j " ++ lbl]
    instrToMIPS _ = []
