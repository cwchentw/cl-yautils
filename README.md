# cl-libs

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Small but handy utilities for Common Lisp.

## Warning

DON'T USE IT IN PRODUCTION ENVIRONMENT.

cl-libs is still experimental and for personal use only. The API may change without warning.

## System Requirements

We test cl-libs against the following Common Lisp implementations:

* SBCL (Steel Bank Common Lisp)
* CCL (Clozure CL)
* Clisp
* ECL (Embeddable Common Lisp)
* ABCL (Armed Bear Common Lisp)

We run the code of cl-libs in Windows, macOS and GNU/Linux.

## How to Use?

Copy *common.lisp* to your own project. Load it in your program.

Scripts under [scripts](/scripts/) directory are optional. Just copy whatever you need.

## Documentation

### Wrappers

Scripts under [scripts](/scripts/) directory are wrappers for specific Common Lisp implementations. Among them, *xxxrun* (and *xxxrun.bat*) are used to invoke Common Lisp scripts in batch mode. *xxxrepl* (and *xxxrepl.bat*) are used to run a REPL environment of Common Lisp.

Scripts without any file extension are POSIX shell scripts, for Unix. Scripts with *.bat* extension are Batch scripts, for Windows.

Currently, we implement wrappers for SBCL, Clozure CL and ABCL.

### *common.lisp*

A collection of utility functions. See [examples](/examples/) for its usage.

## Copyright

Copyright (c) 2020 Michael Chen.

Licensed under MIT.
