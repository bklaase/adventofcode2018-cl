(in-package :cl-user)


;; package definition
(defpackage :aoc2018/day8
  (:use :common-lisp))

;;; package
(in-package :aoc2018/day8)

;; puzzle input
(defvar *input*)
(with-open-file (in-file #P"day8-input.txt")
  (setf *input* (read in-file)))

(defparameter *test-input*
  (list 2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2))

(defun parse-tree (list nodefun)
  "will return a result, creating nodes as specified by nodefun, which takes
    as arguments a list of the nodes, and a list of leaves.
    as a secondary value will return the 'rest' of the list that wasn't consumed
    in the processing."
  (let ((num-nodes (first list))
        (num-leaves (second list))
        (rest (cddr list))
        (nodes nil))
    ;; construct list of ((node1) (node2) .. (noden) leave1 .. leaven))
    (dotimes (i num-nodes)
      (multiple-value-bind (node new-rest) (parse-tree rest nodefun)
        (setf rest new-rest
              nodes (cons node nodes))))
    (values (funcall nodefun (nreverse nodes) (subseq rest 0 num-leaves))
            (nthcdr num-leaves rest))))


(defun collect-referenced-nodes (nodes leaves)
  (mapcan (lambda (leave)
            (let ((node (nth (1- leave) nodes)))
              (when node
                (list node))))
          leaves))

(defun 8a (input)
  (parse-tree input
              (lambda (nodes leaves)
                (cons '+ (nconc nodes leaves)))))

(defun 8b (input)
  (parse-tree input
              (lambda (nodes leaves)
                (cons '+ 
                      (if
                       (null nodes) leaves
                       ;; else
                       (collect-referenced-nodes nodes leaves))))))


(defun print-answers ()
  (format t "8a: sum of all metadata: ~a~%8b: sum of referenced data: ~a"
          (eval (8a *input*)) (eval (8b *input*))))


