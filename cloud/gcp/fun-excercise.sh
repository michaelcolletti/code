!/bin/bash


gcloud auth list 
gcloud config list 


export p=$(gcloud config get0value project)

export INSTANCE_NAME=fishyfish
export ZONE=us-east1-c
export REGION=us-east1
export PORT=8080
export FIREWALL_NAME=icmp-ping-fw
export VPC=vpc-genbio

gcloud compute networks create $VPC >/dev/null 2>&1

printf "Create instance \n"

gcloud compute instances create $INSTANCE_NAME \
          --network $VPC \
          --zone $ZONE  \
          --machine-type e2-micro  \
          --image-family debian-10  \
          --image-project debian-cloud

gcloud container clusters create genbio-backend \
--num-nodes 1 \
--network $VPC \
--zone $ZONE


