Definitions.

D = [0-9]
WhiteSpace = [\s\t]
OpCode = [\+\*\-/]

Rules.

{D}+ :
    {token,{integer, TokenLine, list_to_integer(TokenChars)}}.

{D}+\.{D}+((E|e)(\+|\-)?{D}+)? :
    {token,{float, TokenLine, list_to_float(TokenChars)}}.

{WhiteSpace} : skip_token.
{OpCode} :
    {token, {list_to_atom(TokenChars), TokenLine, list_to_atom(TokenChars)}}.

Erlang code.
