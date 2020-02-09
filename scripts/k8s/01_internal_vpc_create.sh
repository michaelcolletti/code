#!/bin/bash

printf "Creating the VPC \n"
gcloud compute networks create kubernetes-the-hard-way --subnet-mode custom

if [[ $? -eq 0 ]];then
gcloud compute firewall-rules create kubernetes-the-hard-way-allow-internal \
  --allow tcp,udp,icmp \
  --network kubernetes-the-hard-way \
  --source-ranges 10.240.0.0/24,10.200.0.0/16
else 
exit
printf "fail \n"
fi
