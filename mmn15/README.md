# mmn15
The questions are about the proc language            
- [basic-implicit-ref](#basic-implicit-ref)         
    
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



