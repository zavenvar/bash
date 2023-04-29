#!/bin/bash

# Check if argument is provided
if [ $# -eq 0 ]
then
    echo "No arguments supplied. Please provide a folder name."
    exit 1
fi

# Check if folder exists
if [ ! -d "$1" ]
then
    echo "Folder $1 does not exist."
    exit 1
fi

# Iterate over the directory structure and change permissions accordingly
find "$1" -type d -exec chmod 755 {} \; # Change directory permissions to 755
find "$1" -type f -exec chmod 644 {} \; # Change file permissions to 644

echo "Permissions for $1 and its content have been updated successfully."
