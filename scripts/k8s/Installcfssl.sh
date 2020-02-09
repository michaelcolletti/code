#!/bin/bash
#
#
#
SYS=MAC
if [[ $SYS = $LINUX ]];then 
wget -q  https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/linux/cfssl https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/linux/cfssljson 
fi
if [[ $? -ne 0 ]];then
printf "Sorry for the error $? \n"
exit
else
chmod +x cfssl cfssljson
fi

if [[ $SYS = $MAC ]];then
brew install cfssl
if [[ $? -ne 0 ]];then
printf "Sorry for the error $? \n"
exit
else
sudo mv cfssl cfssljson /usr/local/bin/
	fi
		fi


printf "Verify step \n"
sudo cfssl version
if [[ $? -ne 0 ]]; then
printf "exiting\n"
exit
fi
