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
;(list? (quote ((atom turkey) or)))
; Why does this not come through as false?