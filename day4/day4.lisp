(in-package :cl-user)

;; load deps
(ql:quickload :cl-ppcre)
(ql:quickload :cl-interpol)

;; package definition
(defpackage :aoc2018/day4
  (:use :common-lisp))

;;; package
(in-package :aoc2018/day4)

(named-readtables:in-readtable :interpol-syntax)

;; puzzle input
(defvar *input*)
(with-open-file (in-file #P"day4-input.txt")
  (setf *input* (read in-file)))

;;; helper functions
;;; solutions
;;4a
(defun 4a (string)
  )

;;4b
(defun 4b (string)
  )

(defun print-answers ()
  (format t "4a: polymer-length: ~a~%4b: shortest polymer: ~a"
          (4a *input*) (4b *input*)))
