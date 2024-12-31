#!/bin/bash

set -x

# Clone the git repository into the /tmp directory
git clone https://nishant4028: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@github.com/Nishant4028/voting-app-deployment.git /tmp/tmp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: nishant4028/$2:$3|g" k8s-specifications/$1-deployment.yaml

# s1=which microservice we are using (s1,s2,s3 =commandline)
# s2=repo-name insite docker
# s3= tag 

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
