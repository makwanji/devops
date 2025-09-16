#!/bin/bash

rsync -avz --delete --exclude='.git/' ./n8n homelab-docker-vm1:~/code/devops/
