# cl-yautils

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Yet another utilities for Common Lisp.

## System Requirements

One of the following Common Lisp implementations:

* [SBCL (Steel Bank Common Lisp)](http://www.sbcl.org/)
* [Clozure Common Lisp](https://ccl.clozure.com/)
* [CLISP](https://clisp.sourceforge.io/)
* [Embeddable Common Lisp](https://ecl.common-lisp.dev/)
* [ABCL (Armed Bear Common Lisp)](https://armedbear.common-lisp.dev/)

Among those implementations, SBCL is recommended for Lisp newcomers.

## Install

```shell
$ cd path/to/quicklisp/local-projects
$ git clone https://github.com/cwchentw/cl-yautils.git
```

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
