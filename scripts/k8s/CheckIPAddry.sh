#!/bin/bash
#
#
#
KUBERNETES_PUBLIC_ADDRESS=$(gcloud compute addresses describe kubernetes-the-hard-way \
  --region $(gcloud config get-value compute/region) \
  --format 'value(address)')


echo $KUBERNETES_PUBLIC_ADDRESS
