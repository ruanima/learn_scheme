(define (print arg)
    (display arg)
    (display "\n"))

;; Use `lambda' to create functions.
(print (lambda () "Hello, world!"))
(print ((lambda () "Hello, world!")))
(print ((lambda (x) (+ x x)) 5))

;; Assign a function to a var
(define hello-world (lambda () "Hello, world!"))
(print hello-world)
(print (hello-world))

;; You can shorten this using the function definition syntatcic sugar:
(define (hello-world2) "Hello, world!")
(print hello-world2)
(print (hello-world2))

;; The () in the above is the list of arguments for the function
(define hello
  (lambda (name)
    (string-append "Hello " name)))
(print (hello "Steve")) ; => "Hello Steve"
;; ... or equivalently, using a sugared definition:
(define (hello2 name)
  (string-append "Hello " name))
(print (hello2 "Steve")) ; => "Hello Steve"

;; You can have multi-variadic functions too, using `case-lambda'
(define hello3
  (case-lambda
    (() "Hello World")
    ((name) (string-append "Hello " name))))
(print (hello3 "Jake")) ; => "Hello Jake"
(print (hello3)) ; => "Hello World"

;; Functions can pack extra arguments up in a list
(load-option 'format) ; load string format support

(define (count-args . args)
  (format #t "You passed ~a args: ~a\n" (length args) args))
(count-args 1 2 3) ; => "You passed 3 args: (1 2 3)"
;; ... or with the unsugared `lambda' form:
(define count-args2
  (lambda args
    (format #t "You passed ~a args: ~a\n" (length args) args)))
(count-args2 1 2 3) ; => "You passed 3 args: (1 2 3)"

;; You can mix regular and packed arguments
(define (hello-count name . args)
  (format #t "Hello ~a, you passed ~a extra args" name (length args)))
(hello-count "Finn" 1 2 3)
; => "Hello Finn, you passed 3 extra args"
;; ... unsugared:
(define hello-count2
  (lambda (name . args)
    (format #t "Hello ~a, you passed ~a extra args" name (length args))))
