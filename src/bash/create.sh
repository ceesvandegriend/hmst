#!/bin/bash

set -ex

LOCATION="westeurope"
RG_NAME="rg-web"
NAME="static-web"
GITHUB_USER="griend"
GITHUB_REPO="hmst"

az group create \
  --location ${LOCATION} \
  --name ${RG_NAME}

az staticwebapp create \
  --name ${NAME} \
  --resource-group ${RG_NAME} \
  --source https://github.com/${GITHUB_USER}/${GITHUB_REPO} \
  --location ${LOCATION} \
  --branch main \
  --app-location "src/site" \
  --login-with-github
