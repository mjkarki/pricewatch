@echo off
sbcl --load pricewatch.lisp --eval "(sb-ext:save-lisp-and-die """"pricewatch.exe"""" :executable t :application-type :console :toplevel 'main)"
