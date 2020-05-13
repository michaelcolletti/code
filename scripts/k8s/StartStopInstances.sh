#!/bin/bash 
# Start and Stop GCP instances
#
#


if [[ $# -ne 1 ]];then
printf "Need args \n"
exit
fi

printf "Here is the state of the VMs in GCP \n"
gcloud compute instances list

printf "Taking action to $1 using $0. \n"

	for i in `gcloud  compute instances list  |awk '{print$1}'|tail -6`
	do
	gcloud compute instances $1 $i
         done

printf "Completed at `date`"
gcloud compute instances list

