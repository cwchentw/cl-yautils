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
* CLISP
* ECL (Embeddable Common Lisp)
* ABCL (Armed Bear Common Lisp)

We run the code of cl-yautils on Windows, macOS and GNU/Linux.

## How to Use?

Copy *cl-yautils.lisp* to your own project. Load it in your program.

Scripts under [scripts](/scripts/) directory are optional. Just copy whatever you need.

## Documentation

### Wrappers

The scripts under [scripts](/scripts/) directory are the wrappers for specific Common Lisp implementations. Our wrappers can run in either interacting or batching mode.

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

Currently, we implement wrappers for SBCL, Clozure CL and ABCL.

### *cl-yautils.lisp*

A collection of utility functions. This script is packaged under `:cl-yautils`. See [examples](/examples/) for its usage.

## Copyright

Copyright (c) 2020 Michael Chen.

Licensed under MIT.
