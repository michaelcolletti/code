#!/bin/bash
#
#
#sudo pcs cluster setup --name ZabProduction  primary_private_IP_address secondary_private_IP_address
if [[ $# -lt 2 ]];then 
printf "Need private and secondary IP address as arguments \n"
exit
fi
sudo pcs cluster setup --name ZabProduction  $1 $2

