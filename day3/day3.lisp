(in-package :cl-user)
(defpackage :aoc2018/day3
  (:use :common-lisp))

(in-package :aoc2018/day3)


;; puzzle input
(defvar input)
(with-open-file (in-file #P"day3-input.txt")
  (setf input (read in-file)))

;;; constants and helper functions

(defconstant +x+ 1 "x position of the claim")				
(defconstant +y+ 2 "y position of the claim")				
(defconstant +w+ 3 "width of the claim")				
(defconstant +h+ 4 "height of the claim")				

(defmacro bind-claim-props (claimindex claims &body forms)
  "Binds x, y, w and h for a certain claimindex from an array of claims"
  `(let* ((claimindex ,claimindex) 
		  ,@(mapcar (lambda (var)
					  (list var `(aref ,claims claimindex
									   ,(read-from-string
										 (format nil "+~s+" var)))))
					'(x y w h)))
	 ,@forms))

(bind-claim-props 0 input
  (print "x"))

;;; solutions
(defun 3a (input)
  (let* ((claim 0)
		 (x (aref input claim +x+))
		 (y (aref input claim +y+))
		 (w (aref input claim +w+))
		 (h (aref input claim +h+))
	)
