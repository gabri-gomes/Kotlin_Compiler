{module Parser where
import Lexer
import AST

}

%name parse
%tokentype { Token }
%error { parseError }

%token
num             { TOK_NUM $$ }
string          { TOK_STRING $$ }
"+"             { TOK_PLUS }
"-"             { TOK_MINUS }
"*"             { TOK_MULT }
"/"             { TOK_DIV }
"("             { TOK_LPAREN }
")"             { TOK_RPAREN }
"{"             { TOK_LBRACE }
"}"             { TOK_RBRACE }
"="             { TOK_DEF }
"=="            { TOK_EQ }
"!="            { TOK_NOTEQ }
"<"             { TOK_LESS }
"<="            { TOK_LESSEQ }
">"             { TOK_GREATER }
">="            { TOK_GREATEREQ }
"!"             { TOK_NOT }
"%"             { TOK_MOD}   
"||"            { TOK_OR }
"&&"            { TOK_AND }
"true"          { TOK_TRUE }
"false"         { TOK_FALSE }
"var"           { TOK_VAR }    
"val"           { TOK_VAL }
"if"            { TOK_IF }
"else"          { TOK_ELSE }
"while"         { TOK_WHILE }
"print"         { TOK_PRINT }
"println"       { TOK_PRINTLN }
"fun"           { TOK_FUN }   
"main"          { TOK_MAIN } 
"readln"        { TOK_READLN }
id              { TOK_ID $$ }

                            

%%

Main : "fun" "main" "(" ")" Block                { Program [$5] }

Block : "{" Block_s "}"                          { Block $2 }
      


Block_s : Stm Block_s                            { $1 : $2 }
           |                                     { [] }

Stm : Block                                         { $1 }
    | If_                                           { $1 }
    | While_                                        { $1 }
    | "println" "(" Exp ")"                         {PrintLn $3}
    | "print" "(" Exp ")"                           { Print $3 }
    | VarDecl                                       { $1 }
    | ValDecl                                       { $1 }
    | id "=" Exp                                    { Assign (Var $1) $3 }
    | ReadLine                                      { $1 }

If_ : "if" "(" Exp ")" Stm "else" Stm               { IfElse $3 $5 $7 }
    | "if" "(" Exp ")" Stm                          { If $3 $5 }

While_ : "while" "(" Exp ")" Stm                    { While $3 $5 }

Exp : OrExp                                         { $1 }

OrExp : OrExp "||" AndExp                           { Or $1 $3 }
      | AndExp                                      { $1 }

AndExp : AndExp "&&" EqExp                          { And $1 $3 }
       | EqExp                                      { $1 }

EqExp : EqExp "==" RelExp                           { Eq $1 $3 }
      | EqExp "!=" RelExp                           { NotEq $1 $3 }
      | RelExp                                      { $1 }

RelExp : RelExp "<" AddExp                          { Less $1 $3 }
       | RelExp "<=" AddExp                         { LessEq $1 $3 }
       | RelExp ">" AddExp                          { Greater $1 $3 }
       | RelExp ">=" AddExp                         { GreaterEq $1 $3 }
       | AddExp                                     { $1 }

AddExp : AddExp "+" MulExp                          { Add $1 $3 }
       | AddExp "-" MulExp                          { Sub $1 $3 }
       | MulExp                                     { $1 }

MulExp : MulExp "/" Term                            { Div $1 $3 }  
        |MulExp "*" Term                            { Mul $1 $3 }
        | Term "%" Term                             { Mod $1 $3 }
        | Term                                      { $1 }

Term : num                                         { Num $1 }
     | id                                          { Var $1 }
     | "true"                                      { Bool True }
     | "false"                                     { Bool False }
     | "!" Term                                    { Not $2 }
     | "(" Exp ")"                                 { $2 }
     | string                                      { String $1 }

VarDecl : "var" id "=" Exp                         { VarDecl $2 $4 }

ValDecl : "val" id "=" Exp                         { ValDecl $2 $4 }

ReadLine : "var" id "=" "readln" "(" ")"           { ReadLine $2 }  
         | "val" id "=" "readln" "(" ")"           { ReadLine $2 }

{
parseError :: [Token] -> a
parseError toks = error "parse error"
}