#!/bin/bash

target_directory=$1
prefix=$2
old_prefix=$3

for file in $1/*; do
    filename=$(basename $file)
    if [ $3 ]; then
        mv $target_directory/$filename $target_directory/${filename##*$old_prefix}
        mv $target_directory/${filename##*$old_prefix} $target_directory/$prefix${filename##*$old_prefix}
        continue
    fi
    mv $target_directory/$filename $target_directory/$prefix$filename
done