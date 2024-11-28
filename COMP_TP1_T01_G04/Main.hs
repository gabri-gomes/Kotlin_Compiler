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



--symbolTable :: alexScanTokens -> symbolTable
--symbolTable 




--{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- Encapsulate the symbol table and state monad transformer
-- inside a SymbolT monad transformer
--newtype SymbolT m a = SymbolT { unSymbolT :: StateT (Map String Unique) m a }
--    deriving (Functor, Applicative, Monad, MonadTrans, etc)

--runSymbolT ma = runStateT (unSymbolT ma) Map.empty

--intern str = SymbolT go
--    where go = do table <- get
--                  case Map.lookup str table of
--                    Just unique -> return unique
--                    Nothing -> do unique <- lifIO newUnique
--                                  Map.insert str unique table
--                                  put table
--                                  return unique

-- insert :: Ord k => k -> a -> Map k a -> Map k a 
-- update :: Ord k => (a -> Maybe a) -> k -> Map k a -> Map k a
-- lookup :: Ord k => k -> Map k a -> Maybe a
-- elems :: Map k a -> [a]

