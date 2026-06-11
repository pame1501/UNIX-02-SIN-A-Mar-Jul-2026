#!/bin/bash
USER_INPUT="hola"
# $1 refers to the first argument passed to the script
# We check if the string length is zero (the user provided no arguments)
if [[ -z "${USER_INPUT}" ]]; then
 echo "You must provide an argument!"
 exit 1
fi
if [[ -f "${USER_INPUT}" ]]; then
# Check if the provided argument is a regular file
 echo "${USER_INPUT} is a file."
elif [[ -d "${USER_INPUT}" ]]; then
# Check if the provided argument is a directory
 echo "${USER_INPUT} is a directory."
else
# If it exists but is neither a file nor a directory
 echo "${USER_INPUT} is not a file or a directory."
fi
