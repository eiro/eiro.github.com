repl
    erl
good starting points
    http://learnyousomeerlang.com
pros
    OTP
    architecture
cons
    no distribution system

syntax and terminology

    variables starts with upper
    constants are named atoms and starts with lower

    http://www.erlang.se/doc/programming_rules.shtml

    infix operators (functions) allowed
            One = 16#FF div 2#11111111.

    # pattern matching ?
    [A,_] = [Z,Y]
    # perl alike
    [A|_] = [Z,Y]
    hd tl (head tail)
    # list comprehension
    [ 2 * N || N <- List, N rem 2 =:= 0 ]

    [{X,Y} ]



