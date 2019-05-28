#!/bin/bash
BUCKET=tarasowski-pipes-local-deployment
STACKNAME=tarasowski-pipes-local-deployment
echo "Starting deployment from local machine"
rm -rf build && mkdir build
aws cloudformation package --template-file main.yaml --output-template-file build/output.yaml --s3-bucket $BUCKET
aws cloudformation deploy --template-file build/output.yaml --stack-name $STACKNAME --capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND
