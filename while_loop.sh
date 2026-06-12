#!/bin/bash
SIGNAL_TO_STOP_FILE="stoploop" # Define a variable holding the filename that acts as our "stop signal"
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do # Start a loop that runs as long as the file does NOT exist (using ! -f)
 echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exis  #Notify the user that the loop is still waiting
t..."
 echo "Checking again in 2 seconds..." # Indicate the next check interval
 sleep 2 #Pause execution for 2 seconds to avoid high CPU usage
done
echo "File was found! Exiting..." # Once the loop terminates (because the file was created), print this message