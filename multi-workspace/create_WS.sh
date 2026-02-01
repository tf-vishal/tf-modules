#!/bin/bash

set -e

echo "Initialising The terraform config"
terraform init

echo " Creating Dev Env"
terraform workspace new dev
terraform apply -auto-approve

echo "✅ Creating and applying Stage Env"
terraform workspace new stage
terraform apply --auto-approve

echo "✅ Creating and applying Prod Env"
terraform workspace new prod
terraform apply --auto-approve