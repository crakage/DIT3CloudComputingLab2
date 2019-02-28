#!/bin/bash
 echo "Let's Create a VM"
 az login
 wait
 echo "You are logged in"
 echo "Creating Group"
 az group create --name CloudComputingLab2 --location westeurope
 wait
 echo "Creating the VM"
 ip_return=$(echo $(az vm create --resource-group CloudComputingLab2 \
  --name CloudComputingLab2VM \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --output json \
  --verbose | awk '/publicIpAddress/ {match($0,/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/); ip = substr($0,RSTART,RLENGTH); print ip}'))
 wait
 echo "You are done (actually no lol)"


echo "SSH connection " $ip_return
ssh $ip_return

# GOOD until HERE then it goes on the server but the rest of the command are not executed until you leave the server.

# echo "Preparation of the Server"
# sudo apt-get update
# sudo apt-get install python3.6

# echo "Download Github file"
# git clone https://github.com/crakage/DIT3CloudComputingLab2.git

# echo "Initiate Virtual Environement and Libaries"
# python3 -m venv venv
# . venv/bin/activate
# pip install --upgrade pip
# pip install flask
# pip install psutil

# echo "Starting Flask Application"
# python3 main.py 

 # Cleanup >> az group delete --name CloudComputingLab2 --no-wait

 
