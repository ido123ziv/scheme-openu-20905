# mmn15
The questions are about the proc language            
- [basic-implicit-ref](#basic-implicit-ref) 
- [Q1](#q1)         
- [basic-explicit-ref](#basic-explicit-ref) 
- [Q2](#q2)         
   
    
# basic implicit-ref
Available [here](implicit-refs/) 
This example checks if a num is even or odd
```racket
> (run 
    "let x = 0 
        in letrec even(dummy) = if zero?(x) then 1 else 
            begin 
                set x = -(x,1); 
                (odd 888) 
                end 
            odd (dummy) = if zero?(x) then 0 else 
            begin 
            set x = -(x,1); 
            (even 988) 
            end 
    in begin set x = 13; (odd -888) end")
(num-val 1)
```
# Q1 
Adding for-each function utilty
Available here: [q1](q1/)
```racket
> (define ido "let a=3
in let b=4
in let c= 5
in
begin
foreach x in (a,b,c) set x= -(x,1);
-(a, -(0, -(b, -(0,c))))
end")
> (run ido)
(num-val 9)
```

# basic explicit-ref
Available [here](explicit-refs/) 
sets a to 11        
setref of a to 11 
let b set to 11 - (-1) = 12                   
calc a - b = 11 - 12 = -1

```racket
> (run 
"let g = let counter = newref(0)
     in proc (dummy) 
        begin 
            setref(counter, -(deref(counter), -1)); 
            deref(counter) 
        end 
in let a = (g 11) 
    in let b = (g 11) 
        in -(a,b) 
")
(num-val -1)
```

# Q2 
Adding array utilty
Available here: [q2](q2/)
```racket
 (run "let a= #[4]{10,20,30,40}
in begin 
setref([a,2], 80);
defref([a,2])
end")
(num-val 80)

```


