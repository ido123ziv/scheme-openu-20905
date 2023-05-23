# mmn14
The questions are about the proc language            
- [basic-proc](#basic-proc)         
    - [Q1](#q1)         
    - [Q2](#q2)         
    - [Q3](#q3)         

# basic proc
Available [here](proc-lang/)  
```racket
> (define ido "let x = 200
in let f = 
proc (z) -(z,x)
in let x = 100
in let g =
proc (z) -(z,x)
in -((f 1), (g 1))")
> (run ido)
(num-val -100)
> 
```           


# Q1 
Allowing the proc lang to use dynamic binding               
Also writing factorial in `proc`            
Available here: [q1](q1/)

# Q2
Allowing proc to use recursion                  
Checking if `x=2y` in `proc` lang           
calculating multiplication              
Checking if a number is a power of 2            
Available here: [q2](q2/)

# Q3
In this question we allow the proc lang to use default vars and override them with new params
Available here: [q3](q3/)

