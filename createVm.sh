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
 echo "Opening Port 8080"
 az vm open-port --resource-group CloudComputingLab2 --name CloudComputingLab2VM --port 8080
 #echo "Apply DNS name for easy access"
 #az network dns record-set a add-record -g CloudComputingLab2 -z westeurope.cloudapp.azure.com -n dvoillemincclab2 -a 10.0.0.10
 echo "You are done (actually no lol)"


echo "SSH connection " $ip_return
ssh -o "StrictHostKeyChecking no" $ip_return <<EOF
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

 # Cleanup >> az group delete --name CloudComputingLab2 --no-wait

 
