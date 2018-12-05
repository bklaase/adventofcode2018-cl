(in-package :cl-user)

;; load deps
(ql:quickload :cl-ppcre)

;; package definition
(defpackage :aoc2018/day5
  (:use :common-lisp))

;;; package
(in-package :aoc2018/day5)


;; puzzle input
(defvar *input*)
(with-open-file (in-file #P"day5-input.txt")
  (setf *input* (read-line in-file)))

;;; helper functions
(defun chars-same-different-case (char-a char-b)
  (let (( a (char-code char-a)) (b (char-code char-b)))
	(= 32 (- (max a b) (min a b)))))



;;; solutions
;;3a
(defun 5a (string) 
  (let ((ptrn (create-scanner "([A-Z])(?!\1)([a-z])|([a-z])(?!\3)([A-Z])")))
	(labels ((5a-rec (string previouslength)
			   (break)
			   (let* ((new-string (cl-ppcre:regex-replace-all ptrn string ""))
					  (new-length (length new-string)))
				 (if (= new-length previouslength)
					 new-string
					 (5a-rec new-string new-length)))))
	(5a-rec string (length string)))))
