#!/usr/bin/env bash
emacs -Q -batch  -l ert -L auto-loaded-lisp/ -l test/*.el -f ert-run-tests-batch-and-exit
