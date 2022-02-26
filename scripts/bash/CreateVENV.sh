#!/bin/bash 
set -x
#
printf "Your project\t:"
read PROJECT 
cd $PROJECT
python3 -m venv env
source env/bin/activate
# to install / update client libs 
#pip3 install google-cloud-storage
pip3 install --upgrade google-cloud-storage
# when copmplete deactivate
#source env/bin/deactivate
