#lang eopl
; q1 polynomial "𝑎1𝑥𝑛+𝑎2𝑥𝑛−1+⋯+𝑎𝑛"
; p(x)= a0+a1x+a2x2+...+akxk
(require "unittests.scm")

; Polynom DataType

(define-datatype poly poly?
  (zero)
  (make-poly 
   (a integer?)
   (n integer?))
  (add-poly
   (q_x poly?)
   (t_x poly?)))

; degree : Poly -> Integer
(define degree
  (lambda (p_x)
    (cases poly p_x
      (zero () 
          0)
      (make-poly (a n)
          n)
      (add-poly (q_x t_x)
          (max (degree q_x) (degree t_x))))))

; coeff : Poly x Exponent -> Integer
(define coeff
  (lambda (p_x m)
    (cases poly p_x
      (zero () 
          0)
      (make-poly (a n)
          (if (eqv? n m)
              a
              0))
      (add-poly (q_x t_x)
          (+ (coeff q_x m) (coeff t_x m))))))

; is-zero? : Poly -> Boolean
(define is-zero?
  (lambda (p_x)
    (cases poly p_x
      (zero () 
          #t)
      (make-poly (a n)
          (eqv? a 0))
      (add-poly (q_x t_x)
          (and (is-zero? q_x) (is-zero? t_x))))))


; print-poly prints the poly as a string
(define print-poly
  (lambda (p_x)
    (cases poly p_x
      (zero () 
          "0")
      (make-poly (a n)
         (string-append (number->string a) "x^" (number->string n)))
      (add-poly (q_x t_x)
          (string-append ( print-poly q_x) "+" (print-poly t_x))))))


; calc-poly calcs the value of given x on the poly
(define calc-poly
  (lambda (p_x x)
    (cases poly p_x
      (zero () 
          0)
      (make-poly (a n)
         (* a (expt x n)))
      (add-poly (q_x t_x)
          (+ (calc-poly q_x x) (calc-poly t_x x))))))

;unit tests
(define p (add-poly (make-poly 3 4) (make-poly 5 2)) )
(equal?? (degree p) 4)
(equal?? (coeff p 4) 3)
(equal?? (coeff p 2) 5)
(equal?? (coeff p 9) 0)
(equal?? (is-zero? p) #f)

(equal?? (degree (add-poly (make-poly 3 4) (make-poly 5 4))) 4)
(equal?? (degree (add-poly (make-poly 3 4) (make-poly 5 4))) 4)
(equal?? (coeff (add-poly (make-poly 3 4) (make-poly 5 4)) 4) 8)

(equal?? (is-zero? (zero)) #t)
(equal?? (is-zero? (add-poly (zero) (make-poly 0 0))) #t)
(equal?? (is-zero? (add-poly (zero) (make-poly 0 2))) #t)
(equal?? (is-zero? (add-poly (zero) (make-poly 2 2))) #f)

(equal?? (calc-poly (add-poly (make-poly 3 4) (make-poly 2 1)) 2) 52)
(equal?? (calc-poly (make-poly 3 4) 2) 48)
(equal?? (calc-poly (zero) 1) 0)
(report-unit-tests-completed 'poly)