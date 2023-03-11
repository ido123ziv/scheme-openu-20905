#lang racket
; q1
; custom append
(define (my_append l m)
 (if (null? l) m
  (cons (car l) (my_append (cdr l) m))))
; custom append using foldr
(define (my_append_fr xs ys)
  (foldr cons ys xs))
; q2
; custom filter
(define (my_filter try? l)
    (foldr (lambda (element answer)
        (if (try? element)
            (cons element answer)
            answer))
    '()
    l))
; q3
; set diff
(define (set-dif-helper l1 l2 res)
  (if (null? l1) res ; if first is empty
    (
      if (member (car l1) l2) (set-dif-helper (cdr l1) l2 res) ; if first element of l1 is in l2, discard it
      (set-dif-helper (cdr l1) l2 (cons (car l1) res)) ; if not add it to res
    ))
  )
(define (set-dif l1 l2)
  (let ((in-l1-not-in-l2 (set-dif-helper l1 l2 '())))
    (set-dif-helper l2 l1 in-l1-not-in-l2)))
; q4
(define foo ; define fucntion and name it foo
 (lambda (ls s) ; create headless function
    (cond ; cond block
        [(null? ls) `(() . ,s)] ; if list is empty
        [(pair? (car ls)) ; if first element of list is a pair
           (let ((p (foo (car ls) s))) ; runs the recursion on the first item in pair and names it 'p'
              (let ((p1 (foo (cdr ls) (cdr p)))) ; runs the recursion on the second item in pair and names it 'p1'
                `(,(cons (car p) (car p1)) . ,(cdr p1))))] ; '`' is for creating a list/ THINKING to add the first item in both
        [(or (null? (car ls)) (odd? (car ls))) ; if the list is empty or the first item is an odd number
           (let ((p (foo (cdr ls) s))) ; runs the recursion on the remaining of the list 
              `(,(cons (car ls) (car p)) . ,(cdr p)))] ; THINKING add the current odd number to the list
        [else (let ((p (foo (cdr ls) s))) ; an event number, run recursion and name p
                `(,(car p) . ,(add1 (cdr p))))]))) ; if it is an even number add 1 to the counter - s