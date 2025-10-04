#!/bin/bash

emacs --batch \
	  -l ert \
	  -l emacs/local/share/lisp.d/hpb-require--if-available.el \
	  -l emacs/t/hpb-require--if-available-test.el \
	  -f ert-run-tests-batch-and-exit
