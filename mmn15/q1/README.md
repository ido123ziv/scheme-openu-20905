# Changes From Basic Implicit REf:
`lang.scm`:
```racket
      ;;MMN15
      (expression
       ("foreach" identifier "in" "(" (separated-list identifier ",") ")" expression)
       foreach-exp)
```
      
---
`interp.scm`:

```racket
        ;;MMN15
        (foreach-exp (id1 ids body)
                     (if (null? ids)
                         (eopl:error "You must provide at least one id!")
                         (apply-each id1 ids body env)))

  (define apply-each
    (lambda (id1 ids body env)
      (if(null? ids)
         (num-val 23)
         (let* ((id-ref (apply-env env (car ids)))
                (new-env (extend-env id1 id-ref env)))
                ;(val (value-of body new-env)))
          ;; (begin
             ;;(setref! id-ref val)
           (begin
             (value-of body new-env)
             (apply-each id1 (cdr ids) body env))))))
         
```