#!/bin/bash
for ip_address in "$@"; do
 echo "Taking some action on IP address ${ip_address}"
 ping -c 3 "${ip_address}"
done

#functional ip
#github.com = 140.82.112.4
#127.0.0.1
#localhost