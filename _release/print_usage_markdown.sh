#!/bin/bash

echo '## Usage'
echo '```'
gdrive-vince-fork help | tail -n+3
echo '```'

IFS=$'\n'

help=$(gdrive-vince-fork help | grep global | sed -E 's/ \[[^]]+\]//g' | sed -E 's/ <[^>]+>//g' | sed -E 's/ {2,}.+//' | sed -E 's/^gdrive //')

for args in $help; do
    cmd="gdrive-vince-fork help $args"
    echo
    eval $cmd | sed -e '1s/^/#### /' | sed -e $'1s/$/\\\n```/' | sed -e 's/pii/<user>/'
    echo '```'
done
