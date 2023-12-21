#!/bin/bash

FILES="./*.fastq"
for f in $FILES
do
  echo "Processing $f file..."
        num=`wc -l $f | cut -d ' ' -f 1`
        d=`expr $num / 24`
        head -n $d $f > "${f}_new"
        rm $f
        mv "${f}_new" $f
done
