#!/bin/bash

# Assign the first script argument to the NAME variable
NAME="${1}"
# Assign the second script argument to the DOMAIN variable
DOMAIN="${2}"
# Define the output file name for the CSV results
OUTPUT_FILE="results.csv"

# Check if both required arguments (NAME and DOMAIN) are provided
if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then
  # Display usage instructions if arguments are missing
  echo "You must provide two arguments to this script."
  echo "Example: ${0} mysite nostarch.com"
  # Exit the script with a status code of 1 (error)
  exit 1
fi

# Write the CSV column headers into the output file, overwriting existing content
echo "status,name,domain,timestamp" > ${OUTPUT_FILE}

# Perform a single ping request to the specified domain
# Redirect output and errors to /dev/null to keep the terminal clean
if ping -c 1 "${DOMAIN}" &> /dev/null; then
  # If the ping is successful, append 'success' and details to the CSV file
  echo "success,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
else
  # If the ping fails, append 'failure' and details to the CSV file
  echo "failure,${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
fi

nohup ./excercise_solution.sh miweb google.com
ps -ef | grep "[e]xcercise_solution.sh"