#lang eopl

(require "unittests.scm")

(define-datatype prefix-exp prefix-exp?
  (const-exp
   (num integer?))
  (diff-exp
   (operand1 prefix-exp?)
   (operand2 prefix-exp?)))

(define (parse-prefix ls)
  
  (define (parser-prefix ls)
  (cond
    [(integer? (car ls)) (cons (const-exp (car ls)) (cdr ls))]
    [(equal? '- (car ls)) (begin
     (define operand1 (parser-prefix (cdr ls)))
     (define operand2 (parser-prefix (cdr operand1)))
     (cons (diff-exp (car operand1) (car operand2)) (cdr operand2)))]
    [else (eopl:error "not a valid prefix expression")]))
  
  (if (list? ls)
  (car (parser-prefix ls))
  (eopl:error "parse-prefix didn't get get a list")))

;Unit Tests
(equal?? (parse-prefix '(- - 3 2 - 4 - 12 7)) (diff-exp (diff-exp (const-exp 3) (const-exp 2)) (diff-exp (const-exp 4) (diff-exp (const-exp 12) (const-exp 7)))))
(equal?? (parse-prefix '(- -3 2)) (diff-exp (const-exp -3) (const-exp 2)))
(report-unit-tests-completed 'prefix)