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
(define (set-diff-helper l1 l2 res)
  (if (null? l1) res ; if first is empty
    (
      if (member (car l1) l2) (set-diff-helper (cdr l1) l2 res) ; if first element of l1 is in l2, discard it
      (set-diff-helper (cdr l1) l2 (cons (car l1) res)) ; if not add it to res
    ))
  )
(define (set-diff l1 l2)
  (let ((in-l1-not-in-l2 (set-diff-helper l1 l2 '())))
    (set-diff-helper l2 l1 in-l1-not-in-l2)))