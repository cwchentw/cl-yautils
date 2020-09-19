# cl-yautils

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Yet another utilities for Common Lisp.

See its website [here](https://cwchentw.github.io/cl-yautils/).

## Warning

DON'T USE IT IN PRODUCTION ENVIRONMENT.

cl-yautils is still experimental and mostly for personal use. The API may change without warning.

## System Requirements

We test *cl-yautils.lisp* against the following Common Lisp implementations:

* SBCL (Steel Bank Common Lisp)
* CCL (Clozure CL)
* CLISP
* ECL (Embeddable Common Lisp)
* ABCL (Armed Bear Common Lisp)

The code of *cl-yautils.lisp* are portable among Windows, macOS and GNU/Linux but untested on BSD and Solaris.

## Usage

Copy *cl-yautils.lisp* to your own project. Load it in your program.

Alternatively, copy the whole repo to *local-projects/* subdirectory of your [QuickLisp](https://www.quicklisp.org/) or [Roswell](https://github.com/roswell/roswell) distribution.

Scripts under [scripts](/scripts/) directory are optional. Just copy whatever you need.

## Documentation

### Wrappers

The scripts under [scripts](/scripts/) directory are the wrappers for specific Common Lisp implementations. Our wrappers can run in either interactive or batch mode.

Take `sbclrun` as an instance. Run `sbclrun` without argument to start the REPL environment of SBCL:

```
$ sbclrun
```

Run `sbclrun` with a Common Lisp script to run this script in batch mode:

```
$ sbclrun path/to/source.lisp
```

`sbclrun` shares the same arguments as SBCL itself:

```
$ sbclrun --help
```

Since `sbclrun` is just a thin wrapper for SBCL, it passes all argument(s) to SBCL without any modification.

The wrapper scripts without any file extension are POSIX shell scripts, for Unix. The scripts with *.bat* extension are Batch scripts, for Windows.

Currently, we implement the wrappers for SBCL, Clozure CL and ABCL.

### *cl-yautils.lisp*

A collection of utility functions and utility macros. This script is packaged under `:cl-yautils` or its nickname `:yau`. See [here](https://cwchentw.github.io/cl-yautils/) for the API of **cl-yautils**. See some [examples](/examples/) for its usage.

## For Lisp Learners

There is no real batch mode or scripting mode in Clozure CL and ABCL. To simulate such mode in both, add `(quit)` at the end of a script.

Here is a tiny instance:

```lisp
(write-line "Hello World")

;; Simulate batch mode in CCL and ABCL.
#+(or ccl abcl) (quit)
```

## Copyright

Copyright (c) 2020 Michael Chen.

Licensed under MIT.
