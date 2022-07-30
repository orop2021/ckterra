#!/bin/bash
mkdir cka-exam
cd cka-exam
git clone https://github.com/orop2021/ckterra.git
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
echo "Terraform success"
echo "goodluck"