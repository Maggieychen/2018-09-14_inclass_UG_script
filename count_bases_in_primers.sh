#!/usr/bin/env bash

# A script to count the number of bases in a primer
# it expects any number of fasta files as input
# it will be wrong if the last line of sequence info
# does not have a newline character

# expecting a fasta file formated line like this:

# >sequence_id
# AGCTCGTC

# this will get the second line(the bases) in the file
# that's the head piped into tail
# then count the characters (the wc -m)
# but then also substract the one because wc -m count newlines!
# sign.
# Another slolution would be to use tr like so
# head -3 primer_B.fasta | tail -1 | tr -d "\n" |wc -m
for file in "$@"
do
   expr $(head -n 3 "$@" | tail -1 |wc -m) - 1
done
