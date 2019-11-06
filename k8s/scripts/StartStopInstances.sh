#!/bin/bash 
if [[ $# -ne 1 ]];then
printf "Need args \n"
exit
fi

	for i in `gcloud  compute instances list  |awk '{print$1}'|tail -6`
	do
	gcloud compute instances $1 $i
         done

printf "Completed at `date`"
gcloud compute instances list

