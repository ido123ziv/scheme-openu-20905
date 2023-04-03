#lang eopl
; q1 polynomial "𝑎1𝑥𝑛+𝑎2𝑥𝑛−1+⋯+𝑎𝑛"

;------------------------------------------------------------
; taken from eopl code (chapter 2, utils.scm)
(define-syntax equal??
  (syntax-rules ()
    ((_ x y)
     (let ((x^ x) (y^ y))
       (if (not (equal? x y))
           (eopl:error 'equal??
                       "~s is not equal to ~s" 'x 'y)
           (display ""))))))

;------------------------------------------------------------


; Polynom ADT

(define-datatype poly poly?
  (zero)
  (make-poly 
   (a integer?)
   (n integer?))
  (add-poly
   (q_x poly?)
   (t_x poly?)))
