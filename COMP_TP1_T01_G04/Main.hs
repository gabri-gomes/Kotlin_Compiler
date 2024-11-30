module Main where

import Lexer (alexScanTokens)
import Parser (parse)
import CodeGen (codeGen, translateExp) -- Inclui translateExp
import IR (Instr)

import Control.Monad.State (evalState)
import System.IO (isEOF)

type Supply = (Int, Int)
initialSupply :: Supply
initialSupply = (0, 0)

compile :: String -> [Instr]
compile input =
    let
        tokens = alexScanTokens input
        ast = parse tokens
        (instrs, _) = evalState (translateExp [] ast) initialSupply -- Extrai apenas as instruções
    in instrs

main :: IO ()
main = do
    putStrLn "Enter Kotlin code:"
    input <- getContents
    let intermediateCode = compile input
    putStrLn "Intermediate Code:"
    mapM_ print intermediateCode
