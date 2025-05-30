%{
    #define KEYWORD 10
    #define IDENTIFIER 11
    #define INT_CONSTANT 12
    #define CHAR_CONSTANT 13
    #define STRING_LITERAL 14
    #define PUNCTUATOR 15
    #define SINGLE_LINE_COMMENT 16
    #define MULTI_LINE_COMMENT 17
    #define INVALID_TOKEN -1
%}


%x MULTI_LINE_COMM
%x SINGLE_LINE_COMM

KEYWORD                 "char"|"else"|"for"|"if"|"int"|"return"|"void"
IDENTIFIER              [a-zA-Z_][a-zA-Z0-9_]*
DIGIT                   [0-9]
DIGIT_SEQ               [0-9]+
NONZERO_DIGIT           [1-9]
SIGN                    "+"|"-"
INT_CONSTANT            {SIGN}?{NONZERO_DIGIT}{DIGIT}*|"0"
ESCAPE_SEQ              "\\\'"|"\\\""|"\\?"|"\\\\"|"\\a"|"\\b"|"\\f"|"\\n"|"\\r"|"\\t"|"\\v"
C_CHAR                  [^\'\n\\]|{ESCAPE_SEQ}
C_CHAR_SEQ              {C_CHAR}+
CHAR_CONSTANT           \'{C_CHAR_SEQ}\'
S_CHAR                  [^\"\n\\]|{ESCAPE_SEQ}
S_CHAR_SEQ              {S_CHAR}+
STRING_LITERAL          \"({S_CHAR_SEQ})?\"
PUNCTUATOR              "["|"]"|"{"|"}"|"("|")"|"->"|"&"|"*"|"+"|"-"|"/"|"%"|"!"|"?"|"<"|">"|"<="|">="|"=="|"!="|"&&"|"||"|"="|":"|";"|","
WHITESPACE              [ \t\n]

%%

{KEYWORD}               {return 10;}
{IDENTIFIER}            {return 11;}
{INT_CONSTANT}          {return 12;}
{CHAR_CONSTANT}         {return 13;}
{STRING_LITERAL}        {return 14;}
{PUNCTUATOR}            {return 15;}

"/*"                    {BEGIN(MULTI_LINE_COMM);}
<MULTI_LINE_COMM>"*/"   {BEGIN(INITIAL); return MULTI_LINE_COMMENT;}
<MULTI_LINE_COMM>.      { }
<MULTI_LINE_COMM>"\n"   {yylineno++;}

"//"                    {BEGIN(SINGLE_LINE_COMM);}
<SINGLE_LINE_COMM>"\n"  {BEGIN(INITIAL); yylineno++; return SINGLE_LINE_COMMENT;}
<SINGLE_LINE_COMM>.     { }

\n                      {yylineno++;}
{WHITESPACE}            { }
.                       {return INVALID_TOKEN;}

%%

int yywrap(){
    return 1;
}


