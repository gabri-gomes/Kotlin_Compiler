module IR where

-- Temporaries and labels are just strings
type Temp  = String
type Label = String
type Ident = String

-- Instruction Set for Intermediate Representation
data Instr
  = MOVE Temp Temp                -- t1 := t2
  | MOVEI Temp Int                -- t := n
  | MOVES Temp String             -- t := "string"
  | ADD Temp Temp Temp            -- t := t1 + t2
  | SUB Temp Temp Temp            -- t := t1 - t2
  | MUL Temp Temp Temp            -- t := t1 * t2
  | DIV Temp Temp Temp            -- t := t1 / t2
  | MOD Temp Temp Temp            -- t := t1 % t2
  | LESS Temp Temp Temp           -- t := t1 < t2
  | GREATER Temp Temp Temp        -- t := t1 > t2
  | EQ Temp Temp Temp             -- t := t1 == t2
  | NOT Temp Temp                 -- t := !t1
  | LABEL Label                   -- Define a label
  | JUMP Label                    -- Unconditional jump
  | CJUMP Temp Label              -- Conditional jump if Temp is non-zero
  | PRINT Temp                    -- Print the value of a Temp
  | PRINTLN Temp                  -- Print the value of a Temp with newline
  deriving (Show, Eq)
