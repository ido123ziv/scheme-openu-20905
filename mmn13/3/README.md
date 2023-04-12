# Arrays
Here we need to add arrays to let so the following will occur:
```racket
let A = array {10, -(5,7) , zero?(8), array {1,2,3}, 12 }
in
-(<A>[1] , <<A>[4]>[2])
(num-val 8)
```