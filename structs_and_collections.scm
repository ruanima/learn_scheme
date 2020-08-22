(define (print arg)
    (display arg)
    (display "\n"))

;; Record Type
(define-record-type dog
  (make-dog name breed age)
  dog?
  (name dog-name)
  (breed dog-breed)
  (age dog-age))
(define my-pet
  (make-dog "lassie" "collie" 5))
(print (dog-name my-pet))
(print (dog? my-pet))

;;; Pairs (immutable)
;; `cons' constructs pairs, `car' and `cdr' extract the first and second elements
(print (cons 1 2))
(print (car (cons 1 2)))
(print (cdr (cons 1 2)))

;;; Lists

;; Lists are linked-list data structures, made of `cons' pairs and end with a '()
(define a (cons 1 (cons 2 (cons 3 '()))))
(print a)
;; `list' is a convenience variadic constructor for lists
(define b (list 1 2 3))
(print b)
; and a quote can also be used for a literal list value 字面量
(print '(1 2 3))
(print (cons 4 '(1 2 3))) ; => (4 1 2 3)

;; Use `append' to add lists together
(print (append '(1 2) '(3 4))) ; => '(1 2 3 4)

(print (map (lambda (i) (+ 1 i))
  '(1 2 3)))
(print (map 1+ '(1 2 3)))
(print
  (map + '(1 2 3) '(10 20 30)))

;; filter/count/take/drop
(print (filter even? '(1 2 3 4)))    ; => '(2 4)
(print (count even? '(1 2 3 4)))     ; => 2
(print (take '(1 2 3 4) 2))          ; => '(1 2)
(print (drop '(1 2 3 4) 2))          ; => '(3 4)

;;; Vectors
;; Vectors are fixed-length arrays
(print #(1 2 3)) ; => '#(1 2 3)
(print (vector-append #(1 2 3) #(4 5 6)))  ; => '#(1 2 3 4 5 6)

;;; Hashes
; https://groups.csail.mit.edu/mac/ftpdir/scheme-7.4/doc-html/scheme_12.html#SEC106
(load-option 'hash-table)
(define m (make-eq-hash-table))
(hash-table/put! m 'a 1)
(hash-table/put! m 'b 2)
(hash-table/put! m 'c 3)

;; Retrieve a value
(print (hash-table/get m 'a 999)) ; => 1
