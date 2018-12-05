(in-package :cl-user)

;; load deps
(ql:quickload :cl-ppcre)
(ql:quickload :cl-interpol)

;; package definition
(defpackage :aoc2018/day5
  (:use :common-lisp))

;;; package
(in-package :aoc2018/day5)

(named-readtables:in-readtable :interpol-syntax)

;; puzzle input
(defvar *input*)
(with-open-file (in-file #P"day5-input.txt")
  (setf *input* (read-line in-file)))

;;; helper functions
(defun chars-same-different-case (char-a char-b)
  (let (( a (char-code char-a)) (b (char-code char-b)))
    (= 32 (- (max a b) (min a b)))))

(defun react-polymer (string)
  "recursively removes all pairs uU and Uu and returns striped 'polymer'"
  (reduce
   (lambda (x xs)
     (if
      (or (null xs) (not (chars-same-different-case (car xs) x)))
      (cons x xs)
      (rest xs)))
   string :from-end t :initial-value nil))

(defun strip-char-from-string (char string)
  "stips all (upper and lowercaser) versions of char from string"
  (let* ((d (char-downcase char)) (u (char-upcase char))
         (expr #?"[${u}${d}]"))
    (cl-ppcre:regex-replace-all expr string "")))

;;; solutions
;;5a
(defun 5a (string)
  (length (react-polymer string)))

;;5b
(defun 5b (string)
  (let ((max-impacting-char) (max-impact (length string)))
    (dotimes (i 26)
      (let* ((c (code-char (+ i 97)))
             (impact (length (react-polymer (strip-char-from-string c string)))))
        (when (< impact max-impact)
          (setf max-impact impact
                max-impacting-char c))))
    max-impact))

(defun print-answers ()
  (format t "5a: polymer-length: ~a~%5b: shortest polymer: ~a"
          (5a *input*) (5b *input*)))
