#lang racket

(define atom? (lambda (x) (not (list? x))))

; Is it true that this is an atom? atom
(atom? 'atom)
; Yes, beause atom is a string of characters beginning with the letter a.

(atom? 'turkey)
(atom? '1492)
(atom? 'u)
(atom? '*abc$)

; An atom is just something that isn't a list.

(list? '(atom))
(list? '(atom turkey or))
(list? '((atom turkey) or))

; switching to just defining these
; examples of s-expressions
'xyz
'(x y z)
'((x y) z)
'(how are you doing so far) ; contains 6 s expressions, not including the list itself

'(((how) are) ((you) (doing so)) far) ; a collection of s-expressions
; aka a list with three s-expressions
(list? '()) ; an empty list is still a list. it contains 0 s-expressions
; the null list is not an atom, however
(list? '(()()()())) ; a list of many null lists is still a list

; The Law of Car
; The primitive car is defined only for non-empty lists
(car '(a b c)) ; car of this list is a, because it's the first atom in the list

; to set a variable, first define it
(define l null)
; then set it with set!
(set! l '((a b c) x y z))
; then operate on it
(car l)

;(car 'hotdog) won't return because you can't ask for the car of an atom
; you also can't ask for (car '()) because you can't ask for the car of an empty list

(car '(((hotdogs)) (and) (pickle) relish))
(car '(((hotdogs)) (and)))

; The Law of Cdr
; The primitive cdr is defined only for non-empty lists.
; The cdr of any non-empty list is always another list.
(cdr '(a b c))
(cdr '((a b c) x y z))
(cdr '(hamburger)) ; this will return the empty list

(set! l '((x) t r))
(cdr l)

(define a null)
(set! a 'hotdog)
; (cdr a) will error out because you can't get the cdr of an atom

(set! l '())
; (cdr l) will error out because you can't get the cdr of the null list

(set! l '((b) (x y) (c)))
(car (cdr l)) ;because ((x y) (c)) is cdr(l) and (((c))) is cdr(cdr(l))

; (cdr (car l)) will error out because car(l) is an atom and cdr must take a list
; both car and cdr take any non-empty list as an argument

(set! l '(butter and jelly))
(set! a 'peanut)
(cons a l)

(set! a '(banana and))
(set! l '(peanut butter and jelly))
(cons a l)

(define s null)
(set! s '((help) this))
(set! l '(is very ((hard) to learn)))
(cons s l)

; cons takes two arguments
; the first is any s-expression
; the second is any list
(set! s '(a b (c)))
(set! l '())
(cons s l)

(set! s 'a)
(cons s l)

; This shouldn't work. Why does this work?
(set! s '((a b c)))
(set! l 'b)
(cons s l)
; This also shouldn't work, but does.
(set! s 'a)
(cons s l)

(set! l '((b) c d))
(cons s (car l))
(cons s (cdr l))

(set! l '())
(null? l)

; quote() is a notation for the null list.
(null? (quote()))

(set! l '(a b c))
(null? l)

; You cannot ask null? of an atom
; But again, this works where it shouldn't
(set! a 'spaghetti)
(null? a)