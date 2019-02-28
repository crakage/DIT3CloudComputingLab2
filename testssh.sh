#!/bin/bash

ip_return=$(echo $(cat test.txt| awk '/publicIpAddress/ {match($0,/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/); ip = substr($0,RSTART,RLENGTH); print ip}'))

echo "SSH connection " $ip_return
ssh $ip_return