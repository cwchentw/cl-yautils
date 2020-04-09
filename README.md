# cl-yautils

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Yet another utilities for Common Lisp.

## Warning

DON'T USE IT IN PRODUCTION ENVIRONMENT.

cl-yautils is still experimental and for personal use only. The API may change without warning.

## System Requirements

We test cl-yautils against the following Common Lisp implementations:

* SBCL (Steel Bank Common Lisp)
* CCL (Clozure CL)
* Clisp
* ECL (Embeddable Common Lisp)
* ABCL (Armed Bear Common Lisp)

We run the code of cl-yautils on Windows, macOS and GNU/Linux.

## How to Use?

Copy *cl-yautils.lisp* to your own project. Load it in your program.

Scripts under [scripts](/scripts/) directory are optional. Just copy whatever you need.

## Documentation

### Wrappers

The scripts under [scripts](/scripts/) directory are wrappers for specific Common Lisp implementations. Among them, *xxxrun* (and *xxxrun.bat*) are used to invoke Common Lisp scripts in batch mode. *xxxrepl* (and *xxxrepl.bat*) are used to run a REPL environment of Common Lisp.

The scripts without any file extension are POSIX shell scripts, for Unix. The scripts with *.bat* extension are Batch scripts, for Windows.

Currently, we implement wrappers for SBCL, Clozure CL and ABCL.

### *cl-yautils.lisp*

A collection of utility functions. This script is packaged under `cl-yautils`. See [examples](/examples/) for its usage.

## Copyright

Copyright (c) 2020 Michael Chen.

Licensed under MIT.
