# Arrays
Here we need to add arrays to let so the following will occur:
```racket
let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12 }
in
-(<A>[1] , <<A>[4]>[2])
(num-val 8)
```
Define an array:
```racket
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in A")
(array-val (arr (list (num-val 10) (num-val -2) (bool-val #f) (array-val (arr (list (num-val 1) (num-val 2) (num-val 3)))) (num-val 12))))
```
Get Item in Index
```racket
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in <A>[0]")
(num-val 10)
```
using arrows:
```racket
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in <A>[0]")
(num-val 10)
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in <A>[3]")
(array-val (arr (list (num-val 1) (num-val 2) (num-val 3))))
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in <<A>[3]>[1]")
(num-val 2)
```
expected:
```racket
let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12 }
in
-(<A>[1] , <<A>[4]>[2])
```
> (num-val 8)
status:
```racket
> (run "let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12} in -(<A[0]>,<<A[3]>[1]>)")
(num-val 8)
```