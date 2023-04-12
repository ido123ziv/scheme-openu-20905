# basic let
```racket
> (run "let x = 5 in -(6,x)")
(num-val 1)
```
but on let we don't have the arithmetics of `+` , `*` and `/` so we add them on [3.07](1/3-07/):
```racket
> (run "let x = 5 in +(6,x)")
(num-val 11)
> (run "let x = 5 in *(6,x)")
(num-val 30)
> (run "let x = 5 in /(25,x)")
(num-val 5)
> 
```