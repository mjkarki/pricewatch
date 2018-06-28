# pricewatch
SBCL (Common Lisp) practice project. Checks Hinta.fi for the lowest prices. Simple configuration file for links to product pages and for setting alarm limits.

## This project demonstrated the following (Steel Banks) Common Lisp features:
* Regexp (cl-ppcre)
* HTTP GET (drakma)
* creating a standalone executable with a batch file (make.bat)

## Usage
Check the procutlist.txt file for some examples. The format of the file is actually rather simple. The file contains one two-dimensional Lisp-syntax list, where the inner elements have three space-separated items: 1) a URL to Hinta.fi product page (in Finnish), 2) price alarm limit and 3) a short product description for reporting purposes.

## License
BSD 3-Clause License

Copyright (c) 2018, Matti J. Kärki
All rights reserved.
