@echo off
rem sbcl --load pricewatch.lisp --eval "(sb-ext:save-lisp-and-die """"pricewatch.exe"""" :executable t :compression 22 :application-type :console :toplevel 'main)"
sbcl --load pricewatch.lisp --eval "(sb-ext:save-lisp-and-die """"pricewatch.exe"""" :executable t :application-type :console :toplevel 'main)"
