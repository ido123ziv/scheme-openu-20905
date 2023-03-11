; q1
; append
(define (my_append l m)
 (if (null? l) m
  (cons (car l) (my_append (cdr l) m))))
; append using foldr
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
