#!/bin/bash

directory=$1
function Create_Folder_and_Move {
    first_param=$1
    second_param=$2
    if [ ! -d $directory/$second_param ]; then
        mkdir $directory/$second_param
    fi
    mv $first_param $directory/$second_param
}

if [[ $1 == "-h" || $1 == "help" ]]; then
    echo ""
    echo "      Write the target folder name to organize your files"
    echo "          Example: './file_organizor.sh ./Test'"
    echo "      This will create folders according to the file extentions and put the files in them"
    exit 1
fi

if [ ! -d $1 ]; then
    echo "Directory not found"
    exit 1
fi
for file in "$1"/*; do
    if [ -f "$file" ]; then
        echo "$file"
        if [[ "$file" == *.txt ]]; then
            Create_Folder_and_Move $file "Text_Files" 
        elif [[ "$file" == *.jpeg ]]; then
            Create_Folder_and_Move $file "Images"
        elif [[ "$file" == *.sh ]]; then
            Create_Folder_and_Move $file "Shell_Scripts"
        elif [[ "$file" == *.py ]]; then
            Create_Folder_and_Move $file "Python_Files"
        else
            echo "Unknown file extention"
        fi
    fi
done