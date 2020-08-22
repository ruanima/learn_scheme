(define (print arg)
    (display arg)
    (display "\n"))

;;; Numbers
(print "######## Numbers")
(print 9999999999999999999999) ; integers
(print #b111                 ) ; binary => 7
(print #o111                 ) ; octal => 73
(print #x111                 ) ; hexadecimal => 273
(print 3.14                  ) ; reals
(print 6.02e+23)
(print 1/2                   ) ; rationals
(print 1+2i                  ) ; complex numbers

;; Function application is written (f x y z ...)
;; where f is a function and x, y, z, ... are operands
;; If you want to create a literal list of data, use ' to stop it from
;; being evaluated

(print "######## Function")
(print '(+ 1 2)) ; => (+ 1 2)
;; Now, some arithmetic operations
(print (+ 1 1) ) ; => 2
(print (- 8 1) ) ; => 7
(print (* 10 2)) ; => 20
(print (expt 2 3)) ; => 8
(print (quotient 5 2)) ; => 2
(print (remainder 5 2)) ; => 1
(print (/ 35 5)) ; => 7
(print (/ 1 3)) ; => 1/3
(print (exact->inexact 1/3)) ; => 0.3333333333333333
(print (+ 1+2i  2-3i)) ; => 3-1i
