#!/bin/bash 
hostnamectl
echo "      realhostname:" $(aws ec2 describe-tags --filters "Name=resource-id,Values=$(curl -sS http://169.254.169.254/latest/meta-data/instance-id)" "Name=key,Values=Name" --region=eu-west-1 --query Tags[0].Value --output text)
echo "     Instance Type:" $(curl -sS http://169.254.169.254/latest/meta-data/instance-type)
echo "       environment: " $(aws ec2 describe-tags --filters "Name=resource-id,Values=$(curl -sS http://169.254.169.254/latest/meta-data/instance-id)" "Name=key,Values=Env" --region=eu-west-1 --query Tags[0].Value --output text)
echo "              role: " $(aws ec2 describe-tags --filters "Name=resource-id,Values=$(curl -sS http://169.254.169.254/latest/meta-data/instance-id)" "Name=key,Values=Role" --region=eu-west-1 --query Tags[0].Value --output text)