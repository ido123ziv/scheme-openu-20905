(module utilts
  (lib "eopl.ss" "eopl")

(provide equal?? report-unit-tests-completed)
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
(define report-unit-tests-completed
  (lambda (fn-name)
    (eopl:printf "unit tests completed: ~s~%" fn-name)))
  
)