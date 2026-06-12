#!/bin/bash
for file in example_file*; do # The glob 'example_file*' selects all files starting with that pattern.
 if [[ "${file}" == "example_file1" ]]; then #Check if the current filename matches "example_file1" exactly.
 echo "Skipping the first file" # 'continue' stops the current iteration and jumps to the next item in the loop.
  continue
 fi
 echo "${RANDOM}" > "${file}" # Write a random number to all files except "example_file1".
done