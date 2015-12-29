#lang racket

(define atom? (lambda (x) (not (list? x))))

(list? (quote ()))

(list? '())

(atom? (quote abc))

(atom? 'abc)