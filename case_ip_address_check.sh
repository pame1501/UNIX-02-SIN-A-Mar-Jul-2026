#!/bin/bash
IP_ADDRESS="${1}" # Assign the first argument passed to the script to a variable
case ${IP_ADDRESS} in # Assign the first argument passed to the script to a variable
 192.168.*) # Pattern match for the 192.168.x.x network
 echo "Network is 192.168.x.x"   #Print message if the pattern matches
 ;; # Terminate the current match block
 10.0.*)  # Pattern match for the 10.0.x.x network
 echo "Network is 10.0.x.x"   # Print message if the pattern matches
 ;; # Terminate the current match block
 *) # Default case (wildcard) for any other input
 echo "Could not identify the network" # Print message if no other patterns match
 ;; # Terminate the default block
esac # End of the case statement


#Use ip testing = 192.168.hola  10.0.hi