#!/bin/bash

target_directory=$1
prefix=$2
old_prefix=$3

if [[ $1 == "-h" || $1 == "help" ]]; then
    echo ""
    echo ""
    echo "  -Write the target folder as first argument"
    echo "  -Write the prefix you want to add to your files as second argument"
    echo "  -Write the prefix you want to remove as third argument"
    echo "      Example Usage:"
    echo "      './bulk_rename.sh 'target folder' 'prefix' 'optional: remove prefix' '"
    echo ""
    echo ""
    echo "   file1.txt file2.txt file3.jpeg are in the Test folder"
    echo "      './bulk_rename.sh Test Project'"
    echo ""
    echo "   Now the files are Project_file1.txt Project_file2.txt ..."
    echo ""
    echo "      './bulk_rename.sh Test My Project"
    echo ""
    echo "   Now the files are My_file1.txt My_file..."

    exit 1
fi

for file in $1/*; do
    filename=$(basename $file)
    if [ $3 ]; then
        mv $target_directory/$filename $target_directory/${filename##*$old_prefix}
        mv $target_directory/${filename##*$old_prefix} $target_directory/$prefix${filename##*$old_prefix}
        continue
    fi
    mv $target_directory/$filename $target_directory/$prefix$filename
done