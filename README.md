# cl-yautils

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Yet another utilities for Common Lisp.

## System Requirements

One of the following Common Lisp implementations:

* SBCL (Steel Bank Common Lisp)
* CCL (Clozure CL)
* CLISP
* ECL (Embeddable Common Lisp)
* ABCL (Armed Bear Common Lisp)

The code of *cl-yautils.lisp* are portable among Windows, macOS and GNU/Linux but untested on BSD and Solaris.

## Usage

See [examples](/examples).

## Note

There is no real batch mode or scripting mode in Clozure CL and ABCL. To simulate such mode in both, add `(quit)` at the end of a script.

Here is a tiny instance:

```lisp
(write-line "Hello World")

;; Simulate batch mode in CCL and ABCL.
#+(or ccl abcl) (quit)
```

## Copyright

Copyright (c) 2020 Michelle Chen. Licensed under MIT
