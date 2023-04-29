#!/bin/bash

# Function to change permissions
change_permissions() {
    find "$1" -type d -exec chmod 755 {} \; # Change directory permissions to 755
    find "$1" -type f -exec chmod 644 {} \; # Change file permissions to 644
    echo "Permissions for $1 and its content have been updated successfully."
}

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
