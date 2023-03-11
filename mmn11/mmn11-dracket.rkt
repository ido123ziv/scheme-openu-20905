#lang racket
; append
(define (my_append l m)
 (if (null? l) m
  (cons (car l) (my_append (cdr l) m))))
; append using foldr
(define (my_append_fr xs ys)
  (foldr cons ys xs))