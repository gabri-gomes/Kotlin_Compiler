# Kotlin_Compiler

A simple compiler project for a subset of the Kotlin language, developed for academic purposes. The compilation process is divided into several key stages:




# Overview
This project implements the basic components of a compiler:

Lexical Analysis (Lexer.x)
Defines the tokens of the language.

Syntax Analysis (Parser.y)
Defines the grammar of the language, including precedence rules and token structure.

Abstract Syntax Tree (AST.hs)
Builds an AST to represent the hierarchical structure of the code in a way that is easier to analyze.

Symbol Table & Semantic Analysis
Traverses the AST to build the symbol table, check variable declarations, and perform semantic validation.




# Technologies
Kotlin (subset for educational purposes)

Alex (for lexical analysis)

Happy (for parser generation)

Haskell (for AST and semantic analysis)





# How It Works

Run the lexer to tokenize the input source code.

Use the parser to validate the syntax and generate the AST.

Walk the AST to construct the symbol table.

Perform semantic checks such as variable declarations and type consistency.



# Running the Compiler

(You can adjust this section depending on your actual build/run process)


1) Generate lexer and parser:

alex Lexer.x
happy Parser.y

2)  Compile Haskell files:

ghc Main.hs

3)  Run the compiler:

./Main test.txt
