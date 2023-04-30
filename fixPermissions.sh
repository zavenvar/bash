#!/bin/bash

# Default permissions
dir_perm=775
file_perm=644

# Function to change permissions
change_permissions() {
    find "$1" -type d -exec chmod $dir_perm {} \; # Change directory permissions
    find "$1" -type f -exec chmod $file_perm {} \; # Change file permissions
    echo "Permissions for $1 and its content have been updated successfully."
}

# Parse command line options for directory and file permissions
while getopts d:f: option
do
    case "${option}" in
        d) dir_perm=${OPTARG};;
        f) file_perm=${OPTARG};;
    esac
done
shift $((OPTIND -1))

# Check if argument is provided
if [ $# -eq 0 ]; then
    read -p "No folder specified. Do you want to change permissions for the current folder recursively? (y/n) " response
    if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
        change_permissions "."
    else
        echo "No changes have been made."
    fi
else
    for dir in "$@"; do
        if [ -d "$dir" ]; then
            change_permissions "$dir"
        else
            echo "$dir is not a directory. Skipping..."
        fi
    done
fi
