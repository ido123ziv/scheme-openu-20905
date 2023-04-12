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
# Q1 a -> 3.07
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
# Q1 b -> 3.08
but on let we don't have the predicate of `equal?` , `less` and `greater?` so we add them on [3.08](1/3-08/):
```racket
> (run "let x = 3 in equal?(x,x)")
(bool-val #t)
> (run "let x = 3 in less?(x,x)")
(bool-val #f)
> (run "let x = 3 in greater?(x,x)")
(bool-val #f)
> (run "let x = 7
    in let y = 2
        in less?(x,y)")
(bool-val #f)
> (run "let x = 7
    in let y = 2
        in greater?(x,y)")
(bool-val #t)
```