(in-package :cl-user)
(defpackage :aoc2018/day2
  (:use :common-lisp))

(in-package :aoc2018/day2)


;; puzzle input
(defparameter input (list "mphcuiszrnjzxwkbgdzqeoyxfa" "mihcuisgrnjzxwkbgdtqeoylia" "mphauisvrnjgxwkbgdtqeiylfa" "mphcuisnrnjzxwkbgdgqeoylua" "mphcuisurnjzxwkbgdtqeoilfi" "mkhcuisvrnjzowkbgdteeoylfa" "mphcoicvrnjzxwksgdtqeoylfa" "mxhcuisvrndzxwkbgdtqeeylfa" "dphcuisijnjzxwkbgdtqeoylfa" "mihvuisvrqjzxwkbgdtqeoylfa" "mphcuisrrnvzxwkbgdtqeodlfa" "mphtuisdrnjzxskbgdtqeoylfa" "mphcutmvsnjzxwkbgdtqeoylfa" "mphcunsvrnjzswkggdtqeoylfa" "mphcuisvrwjzxwkbpdtqeoylfr" "mphcujsdrnjzxwkbgdtqeovlfa" "mpfcuisvrdjzxwkbgdtteoylfa" "mppcuisvrpjzxwkbgdtqeoywfa" "mphcuisvrnjzxwkbfptqroylfa" "mphcuisvrnjzxwkbgstoeoysfa" "mphcufsvrnjzcwkbgdeqeoylfa" "mphcuissrnjzxwkbgdkquoylfa" "sphcuxsvrnjzxwkbgdtqioylfa" "mphcuiivrhjzxwkbgdtqevylfa" "echcuisvrnjzxwkbgltqeoylfa" "mphcuisvrljexwkbvdtqeoylfa" "mpjcuisvrnjzxwkhidtqeoylfa" "mphcuisvrfjzmwkbgdtqeoylfl" "mwhcuisvrnjzxwkbgdtqeoytfm" "mphcuisvrsjzxwkbgdaqeoylfh" "mohcuisvrnjzxwkbgdtqtoymfa" "maycuisvrnjzxwkbgdtqboylfa" "pphcuisvqnjzxwkbgdtqeoylfd" "mprcuisvrnjtxwmbgdtqeoylfa" "mfhcuisgrnjzxckbgdtqeoylfa" "mphiubsvrnjzxwkbgdtqeoyufa" "dphctisvrnjzxwkbgdtqeoylfk" "mphcuisvrnjznwksgdtqeoyzfa" "mpwcuisvrnjziwkbgdtqaoylfa" "mphduzsvrnjznwkbgdtqeoylfa" "mphccisvrnjzxwebgdtqeoylqa" "xphcuisvrnjzxwkfvdtqeoylfa" "mphcupsvrnjzxwkbgdtfeoylpa" "mphcuisvrtjzjwkbgdtqeoylfe" "mpbcuisvrnjzxwkbgdmieoylfa" "mphcuisvrnjzxwkbgjtqetylaa" "mphcuisvrnjzxwpbgdtgdoylfa" "ophcufsvrqjzxwkbgdtqeoylfa" "iphcuhsvrnjzxwkbgetqeoylfa" "mphcuisvunjzxwwbgdtqeoylqa" "mphcpisvrnjzowkbgdtveoylfa" "mphcuisvrnjzxhkbgdtqeotlla" "mphcuisvrnjzxwkbodtgeoylha" "mphcuisvrjjzxwkbwdtqtoylfa" "mphcwisvrnjnxwkbgjtqeoylfa" "mplcuicqrnjzxwkbgdtqeoylfa" "mphcuisvrnjzxydbgdtqeoylfn" "ophckisvrnjzxwkbgdtqeozlfa" "mphcuisvrkjzxwkbgdtteoblfa" "yphcuisvrnjcxwkbggtqeoylfa" "mphcuisvrnazxwfbqdtqeoylfa" "mphcuisvrmjzxwkbgdtlwoylfa" "mphctksvrnjzxwibgdtqeoylfa" "mphcuisprnjzxlebgdtqeoylfa" "mphcuisnrnjzxakbgdtueoylfa" "mphcuiavrnjoxwtbgdtqeoylfa" "nphcuisvrnjzxwkbgdtqzoylfk" "mphcuisrrnjmxwkbgdtqdoylfa" "mphcuisvrujzxwkvgdtqehylfa" "mphcuisvrnfzxwkogdtqebylfa" "mphcuisvrnjwdwkbgdtqeoyxfa" "mphcuisvrntzxwkrgxtqeoylfa" "mpzcuisvrnjzxwebgdtqeoylsa" "aphcuikvrnjzxwwbgdtqeoylfa" "mphcqisvrnjzxwkpgdtqeoelfa" "mphcuusvrnjzxwkbgdtjeodlfa" "mphcuisvrnjzewkbgdtteoylza" "mphcuisvanjzxwkbgdtheoylfc" "mphcjishrnjzxwkbgltqeoylfa" "mpxcuislrnjzxwkbgdtqeoynfa" "mphcuisvrnjjxwkbgdtmeoxlfa" "mphcimsvrnjzxwkbsdtqeoylfa" "mphcxisvcnjzxwjbgdtqeoylfa" "mphcuisbrvjzxwkbgdtqeoymfa" "mplcuisvrnjzxwkbgdtaenylfa" "mphcuihvrnjzxwkygytqeoylfa" "mphcbisvrnjzxhkbgdtqezylfa" "mphcuisarnjzxwkbgatqeoylfv" "mphcumsvrnjzxwkbgdrqebylfa" "mlhcuisvrnwzxwkbgdtqeoylfx" "mpkcuisvrkjzxwkbgdtqeoylfo" "mphcuissrnjzxwkbgdtqmoylfc" "mphcuiwvrnjuxwkfgdtqeoylfa" "mphcuicvlnjzxwkbgdvqeoylfa" "mphcuisvrvvzxwkbfdtqeoylfa" "myhcuisvrnjpxwkbgntqeoylfa" "mpocuisvrnjzxwtbgitqeoylfa" "mphcuisvrnjzxwkbgdtwewyqfa" "mphcuisvtnjzxwwbgdtqeoolfa" "mphcuisvrnjzxgkbgdyqeoyyfa" "mphcuisvrdjzxwkbgpyqeoylfa" "bphcuisvrnjzxwkbgxtqefylfa" "sphcuisvrdjzxwktgdtqeoylfa" "mphcuvsvrnjmxwobgdtqeoylfa" "mphcuisvrnjzxwkbsdtqeuylfb" "mnhcmisvynjzxwkbgdtqeoylfa" "mphckisvrnjzxwkhgdkqeoylfa" "mpacuisvrnjzxwkbgdtqeoolaa" "mpgcuisvrnjzxwkbzdtqeoynfa" "mphcuisvrojzxwkbzdtqeoylga" "mphcuisvknjfxwkbydtqeoylfa" "mphcuistrnjzxwkbgdqqeuylfa" "bpvcuiszrnjzxwkbgdtqeoylfa" "mphcuxsvrnjzswkbgdtqeoelfa" "mphcuisvbnjzxwlbgdtqeoylla" "mphcuisvonczxwkbgktqeoylfa" "mphcuisvrnkzxwvbgdtquoylfa" "mphcuisvrnjzxokfgdtqeoylia" "tphcuisvrnjzxwkbjdwqeoylfa" "mihcuisvrnjzpwibgdtqeoylfa" "mphcuisvrejzxwkbgdtqjuylfa" "mprcuisvrnjixwkxgdtqeoylfa" "mpqcuiszrnjzxwkbgdtqeodlfa" "mphcuasvrnjzzakbgdtqeoylva" "mphcuisvrnjzmwkbtdtqeoycfa" "mphcuisvrnjzxwkbcdtqioylxa" "mphckisvrnjzxwkbcdtqeoylfm" "mphcuisvrnjuxwbogdtqeoylfa" "mphcuisdrnjzxwkbldtqeoylfx" "mphcuisvrnjoxwkbgdtqeyyyfa" "mphcuicvqnjzxwkbgdtqeoylna" "mpmcuisvrnjzxwkbgdtqktylfa" "mphcuisvrnqzxwkggdtqeoykfa" "mphcuisvryjzxwkbydtqejylfa" "mphcugsvrnjzxwkbghtqeeylfa" "rphcuusvrnjzxwkwgdtqeoylfa" "zphwuiyvrnjzxwkbgdtqeoylfa" "cphcuivvrnjzxwkbgdtqenylfa" "mphcuisvrnjzxwkagotqevylfa" "mprcuisvrcjzxwkbgdtqeoytfa" "mphjugsvrnezxwkbgdtqeoylfa" "mphcuisvryjzxwkbgltqeoylaa" "mphcursvrnjzxfkbgdtqeoydfa" "mphcuisvrcuzxwkbgdtqeoylfw" "mphcuisvrijzxwkbgdtqeoelfh" "xphcuisvenjzxjkbgdtqeoylfa" "mphcuisvrnazxwkbgdeqeoylaa" "mphcuisbrsjzxwkbgdtqeoygfa" "mlhvuisvrnjzxwkbgdtqeoylfh" "mphcuisvrnjzxukbgdtqeoyhfy" "mpzcuilvrnjzawkbgdtqeoylfa" "hphcuisjfnjzxwkbgdtqeoylfa" "mahcuisvrnjzxwkegdtqeoylfi" "mphcuixvrnjzcwkbgdtqetylfa" "mphcuisvrnjzxwkdgdtqeoklfj" "mlhcuisvrnjzxwkbgdteeoylka" "mphcuifvrnjbxwkrgdtqeoylfa" "mphcuasvrnjzzwkbgdtqeoylva" "mphcuisvrnjzxwkboutqeoylba" "mbhcuisvcnjzxwklgdtqeoylfa" "mpbcuisvrnjzxgkbgdtqesylfa" "mphcuisvrnjfswkbgdtqeoylfd" "mphcuisvrnjzxwkbgdoweoysfa" "uphcuisvrnjzrwkbgdtqelylfa" "mphcuisvrnjzxwkbgdtqyoylsi" "mpqcuiqvxnjzxwkbgdtqeoylfa" "mphcuisorfjzxwkbgatqeoylfa" "mphcuisvrntfxwkbzdtqeoylfa" "mphcuisvrnrzxwkbgdtueoylfl" "mphcuisvrnjzewkagdtyeoylfa" "mpocuisdrnjzxwkbgdtqeozlfa" "mphcuisvrnjjxwkbgdtoeoylfm" "mphcuisvenjzxwkbgdtqwoylza" "mpmcuisvrnjzxwkbgdtqeoxlfr" "mphcuisvgnjhxwkbgdtqeoplfa" "mphcuisvrnjzowkdgdtqeoyyfa" "mphcuisqynjzxwkbgdtqeoylda" "hphcuisvgnjzxwkbgdtbeoylfa" "iphcuipvrnuzxwkbgdtqeoylfa" "mphcuisvrnjzsikbpdtqeoylfa" "mpwcuhsvrnjzxbkbgdtqeoylfa" "mnhjuisvcnjzxwkbgdtqeoylfa" "mphcudsvrnjzxwkbgdtqloilfa" "mpncuiwvrwjzxwkbgdtqeoylfa" "mphcuisvrnjgawkbgdtqeoylya" "mphcuisvrnjzxwkbggtteoslfa" "mphcuisvrnjzxwkbgdvqeoylpe" "mphcuisvrnczxfkbgktqeoylfa" "mphcuifvrnjzxwkbgdbmeoylfa" "mphcuisvrnjytwkbgdtqeoylla" "mphcuisvrnjzxwkbgdtjeoxlfn" "mphjuisvrnjzxwkbghtqeoyffa" "mphcuisvrnjzxkrbgdtqeoylaa" "mphcbisvrnjzxwkbgttqeoylfs" "mphkuksvbnjzxwkbgdtqeoylfa" "nphcuidvrnjzxwhbgdtqeoylfa" "mphguzsvrnjzxwkbgdaqeoylfa" "mihcuisfrnjzxwkbgdtqhoylfa" "mphcuisvrnrzxwpbgdtqesylfa" "zphcuisvrnjzxwkbddtqeoylaa" "mphcuigvmnjzxwkbgdtqeoylba" "mjhcuisvrnjzxjkbgdtqeoylha" "mphnuisvrnjznwkbgdtqnoylfa" "mkhcuisvrnjcxwkbgdqqeoylfa" "mphcuisvenjzxwbbqdtqeoylfa" "qphcuisnrnjzawkbgdtqeoylfa" "mphcuisvrdjzxwkbgdtqeoywca" "mphcuzsvvnjzxwfbgdtqeoylfa" "pphcuxsvrnjzxwkbgdtmeoylfa" "mphiuvsvrnjzxlkbgdtqeoylfa" "mphlqisvrnjzxkkbgdtqeoylfa" "mmhcuisvrnjzxwkbgatqeoylea" "mphduisrrnjoxwkbgdtqeoylfa" "mphcuisvrnjnxwkvgdyqeoylfa" "mphcuvsvrnjzxgkbgdtqeoylfz" "mphcuisvryjzxwkbggtqkoylfa" "iphcuisvrdjzxwkbgotqeoylfa" "mphcuisvrnjzxwhbgdtqwoyofa" "mphcorbvrnjzxwkbgdtqeoylfa" "mghcuisvrnpzxykbgdtqeoylfa" "mphauisvrnjnxwkbzdtqeoylfa" "mphcgisvrnjzxwkwgdtqeoygfa" "mphcuisvrnjzxwkggotqeoylba" "mphcuesvrnjzxwkbgdwqebylfa" "yphcuisvrnjzxwkbgdxqeoylja" "ephyuisvrnjzywkbgdtqeoylfa" "mfhcuisqrnjzxwkbgdlqeoylfa" "mphkuisvrnjzxwkbertqeoylfa" "mphcuusgrnjzxwkbggtqeoylfa" "mphcuildrnjvxwkbgdtqeoylfa" "mphcuiuvrnjzlwkbgwtqeoylfa" "mppcuisvrljzxwkbgdtqeoylfw" "mphcwiwvrnjzxwsbgdtqeoylfa" "mphcubivrnjzxwkqgdtqeoylfa" "mphcuisvrnjpxwkngdtqeoylpa" "pchcuisvrgjzxwkbgdtqeoylfa" "mphcuisvlnjzxwkbgdtmeoylfw" "mphcuisvrnjzywkbgdvqeoylfj" "mpzcuisvrnezxwktgdtqeoylfa" "mphcuisvrnjbxwkbgzrqeoylfa" "mphcuisvrnjzxwktgdtqeodtfa" "jphcuiavrnjzxwkbgdtqeoylfv" "mphcuisvrnjzxwkbddppeoylfa" "mphcuissrkjzxwkbgxtqeoylfa" "mphcuisvrhjzxwxbgdtqeoylxa" "mphcvisvgnjjxwkbgdtqeoylfa" "mphcuisprnjwxwtbgdtqeoylfa" "mphcuissrnjzxqkbgdtqeoymfa" "mphcuiabrnjzxokbgdtqeoylfa" "mphcuisvrnczxwkbgmtpeoylfa" ))


;;; helper functions
(defun string-to-char-table (string)
  "function that takes a string, and returns a hash-table
   with the number of occurances as value; char as key"
  (let ((table (make-hash-table)))
	(map nil (lambda (c)
			   (if (gethash c table)
				   (incf (gethash c table))
				   (setf (gethash c table) 1)))
		 string)
	table))

(defun some-hash-p (pred hash-table)
  "function that checks the hashtable for k,v combo's that match pred"
  (maphash (lambda (k v)
			 (when (funcall pred k v)
			   (return-from some-hash-p t)))
		   hash-table))


(defun 2b-str-compare (string1 string2)
  "function that when two strings of equal length differ at most one char
   returns the string they have in common, otherwise nil"
  (let ((mismatch-count 0) (result ""))
	(dotimes (c (length string1))
	  (let ((c1 (elt string1 c)) (c2 (elt string2 c)))
		(if (eql c1 c2)
			(setf result (concatenate 'string  result (string c1)))
			(progn
			  (incf mismatch-count)
			  (when (< 1 mismatch-count)
				(return-from 2b-str-compare nil))))))
	result))


;;; solutions

;; 2a
(defun 2a (input)
  (let ((occ2 0) (occ3 0))
	(dolist (item input)
	  (let ((charmap (string-to-char-table item)))
		  (when (some-hash-p (lambda (k v) (= 2 v)) charmap) (incf occ2)) 
		  (when (some-hash-p (lambda (k v) (= 3 v)) charmap) (incf occ3))))
	(* occ2 occ3)))

;; 2b
(defun 2b (input)
  (let* ((inp-length (length input))
		 (input (make-array inp-length :initial-contents input)))
	(dotimes (x inp-length)
	  (do ((y (1+ x) (incf y))) ((>= y inp-length))
		(let ((compare-result (2b-str-compare (elt input x) (elt input y))))
		  (when compare-result (return-from 2b compare-result)))))))

		 
