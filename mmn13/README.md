# basic let
inclued the following:      
* `-` opertaion           
* `zero?` predicate           
* assingment of vars           
* `if` condition           
```racket
> (run "let x = 5 in -(6,x)")
(num-val 1)
> (run "let x = 0 in zero?(x)")
(bool-val #t)
> (run "if zero?(-(11,11)) then 3 else 4")
(num-val 3)
> (run "if zero?(-(11, 11)) then 3 else foo")
(num-val 3)
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