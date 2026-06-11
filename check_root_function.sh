#!/bin/bash

# Define a function named 'check_if_root'
check_if_root(){
    # Check if the Effective User ID (EUID) _variable is equal to 0 (root's ID)
    # # UID is the real owner, while EUID is the ID used to determine current file/process permissions.
    # Note: Spaces inside [[ ]] are mandatory in Bash
    if [[ "${EUID}" -eq "0" ]]; then
        # Return 0, which represents "true" or "success" in exit codes
        return 0
    else
        # Return 1, which represents "false" or "failure"
        return 1
    fi
}

# Call the function and use the result as the condition for an if statement
if check_if_root; then
    # This block executes if the function returns 0
    echo "User is root!"
else
    # This block executes if the function returns 1
    echo "User is not root!"
fi