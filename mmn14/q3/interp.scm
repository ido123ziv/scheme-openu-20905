(module interp (lib "eopl.ss" "eopl")
  
  ;; interpreter for the PROC language, using the procedural
  ;; representation of procedures.

  ;; The \commentboxes are the latex code for inserting the rules into
  ;; the code in the book. These are too complicated to put here, see
  ;; the text, sorry. 

  (require "drscheme-init.scm")

  (require "lang.scm")
  (require "data-structures.scm")
  (require "environments.scm")

  (provide value-of-program value-of)

;;;;;;;;;;;;;;;; the interpreter ;;;;;;;;;;;;;;;;

  ;; value-of-program : Program -> ExpVal
  (define value-of-program 
    (lambda (pgm)
      (cases program pgm
        (a-program (exp1)
          (value-of exp1 (init-env))))))

  ;; value-of : Exp * Env -> ExpVal
  (define value-of
    (lambda (exp env)
      (cases expression exp

        ;\commentbox{ (value-of (const-exp \n{}) \r) = \n{}}
        (const-exp (num) (num-val num))

        ;\commentbox{ (value-of (var-exp \x{}) \r) = (apply-env \r \x{})}
        (var-exp (var) (apply-env env var))

        ;\commentbox{\diffspec}
        (diff-exp (exp1 exp2)
          (let ((val1 (value-of exp1 env))
                (val2 (value-of exp2 env)))
            (let ((num1 (expval->num val1))
                  (num2 (expval->num val2)))
              (num-val
                (- num1 num2)))))

        ;\commentbox{\zerotestspec}
        (zero?-exp (exp1)
          (let ((val1 (value-of exp1 env)))
            (let ((num1 (expval->num val1)))
              (if (zero? num1)
                (bool-val #t)
                (bool-val #f)))))
              
        ;\commentbox{\ma{\theifspec}}
        (if-exp (exp1 exp2 exp3)
          (let ((val1 (value-of exp1 env)))
            (if (expval->bool val1)
              (value-of exp2 env)
              (value-of exp3 env))))

        ;\commentbox{\ma{\theletspecsplit}}
        (let-exp (var exp1 body)       
          (let ((val1 (value-of exp1 env)))
            (value-of body
              (extend-env var val1 env))))
        
        ;; q3 maman 14 
        ;; update the value calculation of the appropriate cases
        (proc-exp (ids defs body)
          (let ((defs1 (map (lambda (exp) (value-of exp env)) defs)))
          (proc-val (procedure ids defs1 body env))))

        ;; q3 maman 14
        (call-exp (rator params rand)
          (let ((proc (expval->proc (value-of rator env)))
                (arg (map (lambda (exp) (value-of exp env)) exps )))
            (apply-procedure proc arg)))

        )))


  ;; procedure : Var * Exp * Env -> Proc
  ;; Page: 79
  (define procedure
    (lambda (var body env)
      (lambda (val)
        (value-of body (extend-env var val env)))))
  
  (define (extend-multi ids defs params args env)
    (if (null? ids) env)
    (let (
      (index (index-of (car ids) params)))
      (if (= index -1) (extend-multi (cdr ids) (cdr defs) params args (extend-env (car ids) (car defs)
      env))
      
      (extend-multi (cdr ids) (cdr defs) params args (extend-env (car ids) (list-ref args index) env ))
      )))
    
  

  (define apply-procedure
    (lambda (proc params args)
      (cases proc proc1
        (procedure (ids defs body saved-env)
        (value-of body (extend-multi ids defs params args saved-env))))))

  )
