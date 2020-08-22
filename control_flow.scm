(load-option 'format) ; load string format support

(define (print arg)
    (display arg)
    (display "\n"))

;;; Conditionals

(print (if #t               ; test expression
    "this is true"   ; then expression
    "this is false")) ; else expression
; => "this is true"

;; `cond' chains a series of tests to select a result
(print
    (cond ((> 2 2) (error "wrong!"))
        ((< 2 2) (error "wrong again!"))
        (else 'ok))) ; => 'ok

;;; Loops

;; Looping can be done through (tail-) recursion
(define (lp i)
  (when (< i 10)
    (format #t "i=~a\n" i)
    (lp (1+ i))))
(lp 5) ; => i=5, i=6, ...

;; Similarly, with a named let
(let lp ((i 0))
  (when (< i 10)
    (format #t "i=~a\n" i)
    (lp (1+ i)))) ; => i=0, i=1, ...

;; how to get a range? just like range(0, 9)?
;; the original 'iota' only accept one para
(print (iota 10)) ; ==> (0 1 2 3 4 5 6 7 8 9)
(print (iota 5 10)) ; ==> (10 11 12 13 14)
(print (iota 5 10 2)) ; ==> (10 12 14 16 18)
;; If you need a Python like range(5, 10) ==> (5 6 7 8 9), try:
(define (range from to) (map (lambda (x) (+ from x)) (iota (- to from))))
(print (range 5 10))

;; how to do iteration?
(for-each display '(1 2 3 4 5))
;; => 12345
(for-each (lambda (i) (format #t "i=~a\n" i))
          (iota 10)) ; => i=0, i=1, ...
(for-each (lambda (i) (format #t "i=~a\n" i))
          (range 5 10)) ; => i=5, i=6, ...

;; Error handle
(define (handler x)
    (display "Handling Error: ")(display x)(newline)
    (restart 1))
; To have this function handle all conditions do:
(bind-default-condition-handler '() handler)
