# basics
let's take a look on the basics of the language:      
a pair is a set of two items:     
```racket
> (cons 1 2)
(1 . 2)
```
a list is a set of pair recursivly attached     
```racket
> (cons 'a '())
'(a)
```       
some ways to define a list:       
```racket
> (define ido '(1 2 3))
> ido
(1 2 3)
>  (define idoz (list "a" "b" "c"))
> idoz
'("a" "b" "c")
```
let's see some list actions:
```racket
> (car ido)
1
> (cadr ido)
2
> (cddr ido)
(3)
> (cdr ido)
(2 3)
```
* `car` -> first item
* `cadr` -> second item
* `cddr` -> third item
* `cdr` -> rest of list without first item

and define the predicate which is a boolean method:      
```racket
> (null? ido)
#f
> (list? ido)
#t
> (integer? ido)
#f
> (pair? (cons "a" "b"))
#t
```