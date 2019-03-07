#!/bin/bash

# ip_return=$(echo $(cat test.txt| awk '/publicIpAddress/ {match($0,/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/); ip = substr($0,RSTART,RLENGTH); print ip}'))

# echo "SSH connection " $ip_return
# ssh $ip_return

ssh crakage@crakagelab.westeurope.cloudapp.azure.com <<EOF
echo "Preparation of the Server"
sudo apt-get update
sudo apt-get --assume-yes install python3-venv

echo "Download Github file"
git clone https://github.com/crakage/DIT3CloudComputingLab2.git
cd DIT3CloudComputingLab2

echo "Initiate Virtual Environement and Libaries"
python3 -m venv venv
. venv/bin/activate
pip install --upgrade pip
pip install flask
# pip install psutil

echo "Starting Flask Application"
python3 maintest.py 
echo "You done, test now !"
EOF