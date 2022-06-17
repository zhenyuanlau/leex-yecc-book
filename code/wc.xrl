Definitions.

Char = [a-zA-Z]
EOL = \n

Rules.

% <Token Rules>

{Char}+ :
  {token, {word, TokenLen}}.
{EOL} :
  {token, {line, 1}}.
. :
  {token, {char, 1}}.

Erlang code.

-export([count/1]).

count(String) ->
  {ok, Tokens, _} = string(String),
  LineCount = lists:sum([element(2, T) || T <- Tokens, element(1, T) == line]),
  WordCount = lists:sum([1 || T <- Tokens, element(1, T) == word]),
  CharCount = lists:sum([element(2, T) || T <- Tokens]),
  io:format("Lines: ~p Words: ~p Chars: ~p~n", [LineCount, WordCount, CharCount]).
