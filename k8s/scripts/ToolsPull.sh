#!/bin/bash
#
#
#
wget -q  https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/linux/cfssl https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/linux/cfssljson

chmod +x cfssl cfssljson

sudo mv cfssl cfssljson /usr/local/bin/

