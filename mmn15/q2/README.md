# Arrays
This question asked to add arrays utility:       
```racket
let a= ?[4] {10,20,30,40}
```
let's break it down:        
* `a` -> array name                 
* `?` -> array type (this case boolean)                 
* `[4]` -> array size                   
* `{10,20,30,40}` -> array items                    
in order to access array we use: `deref([a,2])`
## Working example
assign value:
```racket
(run "let a= #[4]{10,20,30,40}
in begin 
setref([a,2], 80);
deref([a,2])
end")
(num-val 80)
```

## syntax errors
assign int to boolean array:
```racket
> (run "let a= ?[4]{10,20,30,40}
in begin 
setref([a,2], 80);
deref([a,2])
end")
. . interp.scm:168:16: Array initialization mismatch array type
```

assigning three items to a 4 item array:
```racket
> (run "let a= #[4]{10,20,40}
in begin 
setref([a,2], 80);
deref([a,2])
end")
#<procedure:>>
. . interp.scm:119:12: size doesn't match
```