# Arrays
Here we need to add arrays to let so the following will occur:
```racket
let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12 }
in
-(<A>[1] , <<A>[4]>[2])
(num-val 8)
```
Currently:
```racket
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in A")
(array-val (arr (list (num-val 10) (num-val -2) (bool-val #f) (array-val (arr (list (num-val 1) (num-val 2) (num-val 3)))) (num-val 12))))
```
and
```racket
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in index A[0]")
(num-val 10)
```