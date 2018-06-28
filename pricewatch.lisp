; BSD 3-Clause License
; 
; Copyright (c) 2018, Matti J. Kärki
; All rights reserved.
; 
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
; 
; * Redistributions of source code must retain the above copyright notice, this
;   list of conditions and the following disclaimer.
; 
; * Redistributions in binary form must reproduce the above copyright notice,
;   this list of conditions and the following disclaimer in the documentation
;   and/or other materials provided with the distribution.
; 
; * Neither the name of the copyright holder nor the names of its
;   contributors may be used to endorse or promote products derived from
;   this software without specific prior written permission.
; 
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
; DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
; CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
; OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


(eval-when (:compile-toplevel :load-toplevel :execute)
  (ql:quickload :cl-ppcre :silent t)
  (ql:quickload :drakma :silent t))

(with-open-file (s "productlist.txt")
  (defparameter product-list (eval (read s))))

(defparameter regexp "Halvin hinta ([0-9]+) ")

(defun check-price (item)
  (let ((src (drakma:http-request (car item)))
        (limit (cadr item)))
    (multiple-value-bind (match price) (cl-ppcre:scan-to-strings regexp src)
      (declare (ignore match))
      (if (< limit (parse-integer (aref price 0)))
          (format t "~16a has not reached the alarm limit (~ae). Price today is ~ae.~%" (caddr item) limit (aref price 0))
          (format t "!!!    ~a has reached the alarm limit    !!!~%" (caadr item))))))

(defun main ()
  (dolist (item product-list)
    (check-price item))
  (format t "~%  Press ENTER to quit.~%")
  (read-line))
