#!/bin/bash

set -ex

# Clone the git repository into the /tmp directory
git clone https://nishant4028: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@github.com/Nishant4028/voting-app-deployment.git /tmp/tmp_repo

# Navigate into the cloned repository directory
cd /tmp/tmp_repo

# Check out the main branch (or the branch you want to work on)
git checkout main

# Configure Git user identity
git config user.name "Your Name"
git config user.email "your.email@example.com"

# Make changes to the Kubernetes manifest file(s)
sed -i "s|image:.*|image: nishant4028/$2:$3|g" k8s-specifications/$1-deployment.yaml

# $1=which microservice we are using ($1,$2,$3 =commandline)
# $2=repo-name inside docker
# $3= tag 
echo $1-deployment.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push origin main

# Cleanup: remove the temporary directory
rm -rf /tmp/tmp_repo
