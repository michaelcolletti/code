#!/bin/bash
#
#
#

export STACKNAME=$1
export STACKFILE=$2
FILTER="CREATE_COMPLETE"

if [[ $# -ne "2" ]];then 
echo "Please provide a template to run "
exit 
fi


CreateStack ()
	{
aws cloudformation create-stack --stack-name $STACKNAME --template-body file://$STACKFILE
aws cloudformation list-stacks --stack-status-filter $FILTER 

#--parameters ParameterKey=KeyPairName,ParameterValue=TestKey 
#ParameterKey=SubnetIDs,ParameterValue=SubnetID1\\,SubnetID2

	}


DeleteStack ()
	{

aws cloudformation delete-stack --stack-name $STACKNAME 

	}

StackValidate ()
	{
aws cloudformation list-stacks --stack-status-filter $FILTER

	}

CreateStack;
#DeleteStack;
StackValidate


