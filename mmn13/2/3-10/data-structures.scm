(module data-structures (lib "eopl.ss" "eopl")

  ;; data structures for let-lang.

  (provide (all-defined-out))               ; too many things to list

;;;;;;;;;;;;;;;; expressed values ;;;;;;;;;;;;;;;;

;;; an expressed value is either a number, a boolean or a procval.

  (define-datatype expval expval?
    (num-val
      (value number?))
    (bool-val
      (boolean boolean?))
    (emptylist-val)
      (cons-val (first expval?) (rest expval?))
    )

;;; extractors:

  ;; expval->num : ExpVal -> Int
  ;; Page: 70
  (define expval->num
    (lambda (v)
      (cases expval v
	(num-val (num) num)
	(else (expval-extractor-error 'num v)))))

  ;; expval->bool : ExpVal -> Bool
  ;; Page: 70
  (define expval->bool
    (lambda (v)
      (cases expval v
	(bool-val (bool) bool)
	(else (expval-extractor-error 'bool v)))))

  (define expval->car
    (lambda (v)
      (cases expval v
	(cons-val (first rest) first)
	(else (expval-extractor-error 'cons v)))))

  (define expval->cdr
    (lambda (v)
      (cases expval v
	(cons-val (first rest) rest)
	(else (expval-extractor-error 'cons v)))))

  
  (define expval->emptylist?
    (lambda (v)
      (cases expval v
        (emptylist-val () #t)
	(cons-val (first rest) #f)
	(else (expval-extractor-error 'cons-or-emptylist v)))))

  (define foldr-ido
    (lambda (func init l)
      (if (null? l)
          init
          (func (car l) (foldr-ido func init (cdr l))))))

  (define list-val
    (lambda (elements)
      foldr-ido cons-val (emptylist-val) elements))
  
  (define expval-extractor-error
    (lambda (variant value)
      (eopl:error 'expval-extractors "Looking for a ~s, found ~s"
	variant value)))

;;;;;;;;;;;;;;;; environment structures ;;;;;;;;;;;;;;;;

;; example of a data type built without define-datatype

  (define empty-env-record
    (lambda () 
      '()))

  (define extended-env-record
    (lambda (sym val old-env)
      (cons (list sym val) old-env)))
  
  (define empty-env-record? null?)
  
  (define environment?
    (lambda (x)
      (or (empty-env-record? x)
          (and (pair? x)
               (symbol? (car (car x)))
               (expval? (cadr (car x)))
               (environment? (cdr x))))))

  (define extended-env-record->sym
    (lambda (r)
      (car (car r))))

  (define extended-env-record->val
    (lambda (r)
      (cadr (car r))))

  (define extended-env-record->old-env
    (lambda (r)
      (cdr r)))

)
