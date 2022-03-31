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

### Data Type

* `nullable`: declare a nullable data type ([ex](/examples/nullable-type.lisp))

### Variable

* `default`: set a default value for a variable with `nil` ([ex](/examples/default.lisp))
* `defined`: check whether a variable is defined ([ex](/examples/check-variable-existence.lisp))

### Math

* `average`: get the average of a list of numbers
* `random-integer`: create a random integer ([ex](/examples/random-integer.lisp))

### List

* `proper-list`: convert a list with dotted pair(s) to a proper one ([ex](/examples/proper-list.lisp))
* `flatten`: flatten a list with or without dotted pair(s) ([ex](/examples/flatten.lisp))

### Console

* `puts`: print an object with a trailing newline to standard output
* `perror`: print an object with a trailing newline to standard error

## Copyright

Copyright (c) 2020 Michelle Chen. Licensed under MIT
