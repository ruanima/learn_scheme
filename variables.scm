(define (print arg)
    (display arg)
    (display "\n"))

;; You can create a variable using define
;; a variable name can use any character except: ()[]{}",'`;#|\
(define some-var 5)
(print some-var)

;; Accessing a previously unassigned variable is an exception
; x ; => x: undefined ...

;; Local binding: `me' is bound to "Bob" only within the (let ...)
(define me "Tom")
(print me)
; let syntax
; (let name ((binding expression) ...)
;   body ...)
(let ((me "Bob"))
    (print me))
