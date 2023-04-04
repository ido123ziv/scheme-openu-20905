#lang eopl

(require "unittests.scm")

(define empty-env
  (lambda ()
    (list 
     (lambda (search-var)
      (eopl:error "No binding found: " search-var))
     (lambda (search-var) #f))))

(define extend-env
  (lambda (saved-var saved-val saved-env)
    (list 
     (lambda (search-var)
      (if (eqv? search-var saved-var)
          saved-val
          (apply-env saved-env search-var)))
      (lambda (search-var) 
        (if (eqv? search-var saved-var)
            #t
            ((cadr saved-env) search-var))))))

(define apply-env 
  (lambda (env search-var)
    ((car env) search-var)))

(define (has-binding? env search-var)
  ((cadr env) search-var))