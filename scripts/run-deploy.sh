#!/bin/bash
set -e

echo " Starting deployment via Ansible... "

IMAGE_NAME=$1
IMAGE_TAG=$2
ENVIRONMENT=$3

if [ -z "$IMAGE_NAME" ] || [ -z "$IMAGE_TAG" ] || [ -z "$ENVIRONMENT" ]; then
  echo " Missing parameters "
  echo " Usage: ./run-deploy.sh <image_name> <image_tag> <env> "
  exit 1
fi

ansible-playbook ansible/deploy.yml \
  -i ansible/inventory \
  --extra-vars "image_name=$IMAGE_NAME image_tag=$IMAGE_TAG env=$ENVIRONMENT"

echo " Deployment Completed "
