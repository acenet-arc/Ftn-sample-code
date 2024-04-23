#!/bin/bash
# Requires gnuplot on the $PATH
# Do 'module load gnuplot' first on Alliance systems
export XDG_RUNTIME_DIR=/tmp/runtime-rdickson
gnuplot --persist --slow <<EOF
set datafile separator comma
plot "final_temperature.csv" using "x":"temperature"
EOF
