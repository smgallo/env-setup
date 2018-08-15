#!/bin/sh

percent=$1
shift

for f in $*; do
	convert -verbose  $f -resize $percent"%" ${f}-resize
done
