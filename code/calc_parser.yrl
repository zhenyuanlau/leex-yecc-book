Nonterminals expression term number.

Terminals integer float '+' '-' '*' '/'.

Rootsymbol expression.

expression -> expression '+' term : '$1' + '$3'.
expression -> expression '-' term : '$1' - '$3'.
expression -> term : '$1'.

term -> term '*' number : '$1' * '$3'.
term -> term '/' number : '$1' / '$3'.
term -> number : '$1'.

number -> integer : ?exprs('$1').
number -> float : ?exprs('$1').

Erlang code.

-export([eval/1]).

-define(id(Token), element(1, Token)).
-define(location(Token), element(2, Token)).
-define(exprs(Token), element(3, Token)).

eval(String) ->
    {ok, Tokens, _} = calc_tokenizer:string(String),
    io:format("Tokens: ~w~n", [Tokens]),
    case calc_parser:parse(Tokens) of
        {ok, Forms} ->
            io:format("Forms: ~w~n", [Forms]);
        {error, Error} ->
            io:format("Error: ~p~n", [Error])
    end.
