#!/bin/bash

base=$(pwd)
bindir=~/.bin
mkdir -p $bindir

for dir in */; do
    dir=${dir%?}
	ln -s $base/$dir/run.sh $bindir/$dir
done
