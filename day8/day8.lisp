(in-package :cl-user)


;; package definition
(defpackage :aoc2018/day8
  (:use :common-lisp))

;;; package
(in-package :aoc2018/day8)

;; puzzle input
(defvar *input*)
(with-open-file (in-file #P"day8-input.txt")
  (setf *input* (read-line in-file)))
