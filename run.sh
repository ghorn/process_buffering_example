#!/usr/bin/env bash

# exit on error
set -e

# echo commands
set -x

ghc --make PrintStdOutBuffering.hs -o print_stdout_buffering
ghc --make CallOtherProcess.hs -o call_other_process
./call_other_process
cat test.log
