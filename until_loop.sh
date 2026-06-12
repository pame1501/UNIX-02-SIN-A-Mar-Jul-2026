#!/bin/bash
FILE="output1.txt" # Define the target filename
touch "${FILE}" #Create a file 
# Start an 'until' loop: this loop will continue to run as long as the 
# condition is FALSE. It will stop once the file size is greater than zero.
until [[ -s "${FILE}" ]]; do
# Display status messages to the user
 echo "${FILE} is empty..."
 echo "Checking again in 2 seconds..."
 sleep 2 # Wait for 2 seconds before checking the file status again
done
echo "${FILE} appears to have some content in it!" # This message prints once the loop condition is true
