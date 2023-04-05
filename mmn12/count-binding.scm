#lang eopl

(require "unittests.scm")

(define empty-env
  (lambda ()
    (list 
     (lambda (search-var)
      (eopl:error "No binding found: " search-var))
     (lambda (search-var) 0))))

(define extend-env
  (lambda (saved-var saved-val saved-env)
    (list 
     (lambda (search-var)
      (if (eqv? search-var saved-var)
          saved-val
          (apply-env saved-env search-var)))
      (lambda (search-var) 
        (if (eqv? search-var saved-var)
            (+ 1 ((cadr saved-env) search-var))
            ((cadr saved-env) search-var))
        ))))

(define apply-env 
  (lambda (env search-var)
    ((car env) search-var)))

(define (count-binding env search-var)
  ((cadr env) search-var))

(equal?? (count-binding env1 'x) 0)
(equal?? (count-binding env2 'x) 1)
(equal?? (count-binding env3 'y) 1)
(equal?? (count-binding env4 'x) 2)
(equal?? (count-binding env4 'z) 0)
(report-unit-tests-completed count-binding)