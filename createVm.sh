#!/bin/bash
 echo "Let's Create a VM"
 az login
 wait
 echo "You are logged in"
 echo "Creating Group"
 az group create --name CloudComputingLab2 --location westeurope
 wait
 echo "Creating the VM"
 az vm create --resource-group CloudComputingLab2 \
  --name CloudComputingLab2VM \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --output json \
  --verbose
 wait
 echo "You are done (actually no lol)"
 

 # Cleanup >> az group delete --name CloudComputingLab2 --no-wait

 
 # TODO
 # Get IP address / SSH login /  create virtualenv|install flask & psutil
 # pull the server from github
 # start flask application