module Main where

import Lexer
import Parser
import AST
import Instructions
import MIPS
import Intermediate
import qualified Data.Map as Map
import           Control.Monad.State (State)
import qualified Control.Monad.State as State


initialSupply :: Supply
initialSupply = (0, 0)


runIntermidiate :: State Supply [Instr] -> [Instr]
runIntermidiate int = State.evalState int initialSupply








----------------------------------------------------------- ** Função principal ** -------------------------------------------------------------



main :: IO ()
main = do
  
  txt <- getContents
  
  
  let tokens = alexScanTokens txt
  let ast = parse tokens
  let inst = runIntermidiate (translateProg ast)

  
  putStrLn "Tokens Gerados:"
  print tokens
  putStrLn "\nAST (Abstract Syntax Tree):"
  print ast

 
  putStrLn "\nCódigo Intermidiate (Intermediário):"
  printInst inst

  
  let mipsCode = unlines $ mipsList inst

  
  putStrLn "\nCódigo MIPS gerado:"
  putStrLn mipsCode

  
  writeFile "output.mips" mipsCode
  putStrLn "\n A file was created with the generated MIPS code\n"


printInst :: [Instr] -> IO ()
printInst = mapM_ print


printMIPS :: [Instr] -> IO ()
printMIPS instrs = putStrLn $ unlines $ mipsList instrs
