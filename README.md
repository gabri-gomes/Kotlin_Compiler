# Kotlin_Compiler
Kotlin Compiler


1º -> Definir Tokens da linguagem (Programa Lexer.x)

2º -> Definir um gramática AKA. autômato da linguagem (precedências, forma dos tokens, … ) (Programa Parser.y) 

3º -> Definir a AST, é uma árvore que "organiza" o código para a leitura (AST.hs)   

4º -> Definir a tabela de símbolos, lê a AST resultante do Parser.y e coloca as variáveis nela e avalia a coerência.
