(define (print arg)
    (display arg)
    (display "\n"))

;;; Booleans
(print "######## Booleans")
(print #t) ; for true
(print #f) ; for false -- any value other than #f is true
(print (not #t)) ; => #f
(print (and 0 #f (error "doesn't get here"))) ; => #f
(print (or #f 0 (error "doesn't get here")))  ; => 0

;; for numbers use `='
(print (= 3 3.0)) ; => #t
(print (= 2 1)) ; => #f

;; for characters use `char=?'
(print (char=? #\c #\c)) ; => #t

;; for object identity use `eq?'
;; WARNING: don't use `eq?' on numbers and characters, the reason is very simple:
;;          because RnRs treat this rule as undefined!
;;(eq? 3 3) ; => Wrong! it's undefined! So it depends on implementation!
;; No matter if you got #t from above, it's a wrong usage!!!
;; Should use (= 3 3) or (eqv? 3 3)

;; eq?是判断两个参数是否指向同一个对象
(print (eq? (list 3) (list 3))) ; => #f
;; Why it's #f? Because comparison between objects depends on their head-pointers.
;; These two lists are different objects, and they have different head-pointers.

(print (eq? 'a 'a)) ; => #t
;; Symbols are the typical objects to compare with their head-pointers

;; 其中eq?和eqv?的功能基本是相同的，只在不同的Scheme语言中表现不一样。
;; eqv?
;; The difference between `eqv?' and `eq':
;; You can compare numbers and characters with `eqv?'
;; When you use `eqv?' for any objects other than numbers&characters, it's the
;; same with `eq?'.
(print (eqv? 3 3))     ; => #t
(print (eqv? #\c #\c)) ; => #t
(print (eqv? 'a 'a))   ; => #t

;; for collections use `equal?'
;; `equal?' will compare all the values in a collections type like record or list.
;; You can compare any objects with `equal?' safely, but inefficiency.
;; equal?则是判断两个对象是否具有相同的结构并且结构中的内容是否相同，它用eq?来比较结构中成员的数量；equal?多用来判断点对，列表，向量表，字符串等复合结构数据类型。
(print (equal? (list 'a 'b) (list 'a 'b))) ; => #t
(print (equal? (list 'a 'b) (list 'b 'a))) ; => #f

;; Choosing proper equal pred for you code, is one of the art in Scheme programming!

(print (eqv? "abcd" "abcd"))
;; Obviously, strings are collections type, so...it's your EXECISE now!

