module Main where

import Data.Map 

import Lexer
import Parser


main :: IO ()
main = do
  txt <- getContents

  print(alexScanTokens txt)


  print("--------------------------------------------------------------------")

  print (parse $ alexScanTokens txt)
