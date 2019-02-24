#!/bin/bash

cat test.txt| awk '/publicIpAddress/ {match($0,/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/); ip = substr($0,RSTART,RLENGTH); exit ip}'
ip_return=$?.$?.$?.$?
 echo "SSH connection"
 echo $ip_return
 #ssh $ip_return