(in-package :cl-user)
(defpackage :aoc2018/day3
  (:use :common-lisp))
(in-package :aoc2018/day3)


;; puzzle input
(defvar *input*)
(with-open-file (in-file #P"day3-input.txt")
  (setf *input* (read in-file)))

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

(defun apply-claim-to-cloth (cloth x y w h)
  "changes cloth array object by incrementing its positions with claim overlap
   returns the ammount of newly conflicting positions"
  (let ((conflicts 0))
    (do* ((xi x
              (if (< xi (1- (+ x w))) (1+ xi) x))
          (yi y
              (if (= xi x) (1+ yi) yi)))
         ((>= yi (+ y h)))
      (incf (aref cloth xi yi))
      (when (= 2 (aref cloth xi yi)) ; two claims want this "piece"
        (incf conflicts)))
    conflicts))

(defun check-claim-with-cloth (cloth x y w h)
  "does a check on a cloth with claims applied. when and only when
   the claim found to have only places with exactly one claim, it is valid"
  (do* ((xi x
            (if (< xi (1- (+ x w))) (1+ xi) x))
        (yi y
            (if (= xi x) (1+ yi) yi)))
       ((>= yi (+ y h)))
    (when (< 1 (aref cloth xi yi)) ; multiple claims want this "piece"
      (return-from check-claim-with-cloth nil)))
  t)

;;; solutions
(defun 3a (input)
  (let ((cloth (make-array '(1000 1000) :initial-element 0))
        (claim-ammount (first (array-dimensions input)))
        (number-of-conflicts 0))
    (dotimes (claimindex claim-ammount)
      (bind-claim-props claimindex input
        (incf number-of-conflicts (apply-claim-to-cloth cloth x y w h))))
    (values number-of-conflicts cloth)))


(defun 3b (input cloth)
  (let ((claim-ammount (first (array-dimensions input))))
    (dotimes (claimindex claim-ammount)
      (bind-claim-props claimindex input
        (when (check-claim-with-cloth cloth x y w h)
          (return-from 3b (1+ claimindex)))))))

;;; answers

(defun print-answers ()
  (multiple-value-bind (3a-answer claimed-cloth) (3a *input*)
    (let (( 3b-answer (3b *input* claimed-cloth)))
      (format t "3a: ~a conflicts~%3b: claim number ~a is safe."
              3a-answer 3b-answer))))
