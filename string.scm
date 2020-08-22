(load-option 'format) ; load string format support

(define (print arg)
    (display arg)
    (display "\n"))

;;; Characters
;; According to RnRs, characters only have two notations:
;; #\ and #\x
;; Racket support #\u, but it's never Scheme.
(print #\A) ; => #\A
(print #\λ) ; => #\λ
(print #\x03BB) ; => #\λ
(print #\中) ; => #\中
(print #\x4e2d) ; => #\中 , "\u4e2d" in Python

;;; Strings are fixed-length array of characters.
(print "Hello, world!")
(print "Benjamin \"Bugsy\" Siegel")   ; backslash is an escaping character
(print "Foo\tbar\a\r\n") ; includes C escapes (only support hex)
;; try to print the above string
;; Printing is pretty easy
(display "I'm Guile. Nice to meet you!\n")
;; and unicode escapes
(print "\u004B中国") ; => K

;; string append
(print (string-append "Hello " "world!"))

;; A string can be treated like a list of characters
(print (string-ref "Apple" 0)) ; => #\A

;; format can be used to format strings:
; #t ==> print "strings can be formatted" on screen
(format #t "~a can be ~a" "strings" "formatted")  ; like printf in c
(display "\n")
; #f ==> string "strings can be formatted" as return value
(print (format #f "~a can be ~a" "strings" "formatted")) ; like sprintf in c
