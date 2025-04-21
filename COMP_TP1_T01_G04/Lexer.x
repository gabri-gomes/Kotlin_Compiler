{
module Lexer where
}

%wrapper "basic"

$white = [\ \t\n\r]
$digit = [0-9]

tokens :-
    $white+                             ; 

    \/\/.*                              ; 

    "/*"(\*$white|(\*[^\/])|[^\*]|$white)*"*/"       ;
 
    "var"        { \s -> TOK_VAR }     
    "val"        { \s -> TOK_VAL }     
    "if"         { \s -> TOK_IF }      
    "else"       { \s -> TOK_ELSE }    
    "while"      { \s -> TOK_WHILE }   
    "println"    { \s -> TOK_PRINTLN } 
    "print"      { \s -> TOK_PRINT }   
    "readln"     { \s -> TOK_READLN } 
    "true"       { \s -> TOK_TRUE }    
    "false"      { \s -> TOK_FALSE }   
    "fun"        { \s -> TOK_FUN }     
    "main"       { \s -> TOK_MAIN }    
    "{"          { \s -> TOK_LBRACE }  
    "}"          { \s -> TOK_RBRACE }  
    "<="         { \s -> TOK_LESSEQ }  
    ">="         { \s -> TOK_GREATEREQ }
    ">"          { \s -> TOK_GREATER }
    "<"          { \s -> TOK_LESS }
    "%"          { \s -> TOK_MOD }
    "+"          { \s -> TOK_PLUS }
    "-"          { \s -> TOK_MINUS }
    "*"          { \s -> TOK_MULT }
    "/"          { \s -> TOK_DIV }
    "=="         { \s -> TOK_EQ }
    "!="         { \s -> TOK_NOTEQ }
    "="          { \s -> TOK_DEF }
    "&&"         { \s -> TOK_AND }
    "||"         { \s -> TOK_OR }
    "!"          { \s -> TOK_NOT }
    "("          { \s -> TOK_LPAREN }
    ")"          { \s -> TOK_RPAREN }
    \" [^\"]* \" { \s -> TOK_STRING (init (tail s)) }  
    [A-Za-z_][A-Za-z0-9_]* { \s -> TOK_ID s }
    $digit+      { \s -> TOK_NUM (read s) }

{

data Token
    = TOK_NUM Int
    | TOK_PLUS
    | TOK_MINUS
    | TOK_MULT
    | TOK_DIV
    | TOK_MOD
    | TOK_LPAREN
    | TOK_RPAREN
    | TOK_EQ
    | TOK_TRUE
    | TOK_FALSE
    | TOK_ID String
    | TOK_IF
    | TOK_ELSE
    | TOK_VAR   
    | TOK_VAL   
    | TOK_READLN 
    | TOK_FUN   
    | TOK_MAIN  
    | TOK_DEF   
    | TOK_WHILE
    | TOK_NOTEQ
    | TOK_LESS
    | TOK_LESSEQ
    | TOK_GREATER
    | TOK_GREATEREQ
    | TOK_LBRACE
    | TOK_RBRACE
    | TOK_NOT
    | TOK_OR
    | TOK_AND
    | TOK_PRINT
    | TOK_PRINTLN
    | TOK_ASP
    | TOK_STRING String
    deriving (Eq, Show)
}
