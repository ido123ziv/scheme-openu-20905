# mmn13
The questions are about the let language            
- [basic-let](#basic-let)         
    - [Q1-arithmetics](#q1-a---307)         
    - [Q1-predicates](#q1-b---308)         
    - [Q2-listOperations](#q2-a---309)         
    - [Q2-list](#q2-b---310) 
- [arrays](#q3-arrays)

# basic let
Available [here](let-lang/)             
Includes the following:      
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
# Q2 a -> 3.09
but on let we don't have the list operators of `cons`, `null?` `car` , `cdr` and `emptylist` so we add them on [3.09](2/3-09/):
```racket
> (run "let x = 4
       in cons(x,
                cons(cons(-(x,1),
                           emptylist),
                                     emptylist))")
(cons-val (num-val 4) (cons-val (cons-val (num-val 3) (emptylist-val)) (emptylist-val)))
> (run "let x = 4
       in car(
          cons(-(x,1),emptylist))")
(num-val 3)
> (run "let x = 4
       in null?
          (cons(-(x,1),emptylist))")
(bool-val #f)
> (run "let x = 4
       in cdr(cons(x,
                cons(cons(-(x,1),
                           emptylist),
                                     emptylist)))")
(cons-val (cons-val (num-val 3) (emptylist-val)) (emptylist-val))
```
# Q2 b -> 3.10
but on let we don't the list operator `list(item1, item2, item3)` [3.10](2/3-10/):
```racket
> (run "let x = 4
in list(x, -(x,1), -(x,3))")
(list (num-val 4) (num-val 3) (num-val 1))
```
# Q3 Arrays
adding support for `arrays`! [q3](3/):
```racket
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in A")
(array-val (arr (list (num-val 10) (num-val -2) (bool-val #f) (array-val (arr (list (num-val 1) (num-val 2) (num-val 3)))) (num-val 12))))
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in <A>[1]")
(num-val 10)
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in <A>[2]")
(num-val -2)
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in <A>[3]")
(bool-val #f)
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in <A>[4]")
(array-val (arr (list (num-val 1) (num-val 2) (num-val 3))))
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in <<A>[4]>[2]")
(num-val 2)
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in <A>[5]")
(num-val 12)
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in -(<A>[1],<<A>[4]>[2])")
(num-val 8)
```