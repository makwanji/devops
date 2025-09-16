#!/bin/bash

rsync -avz --delete --exclude='.git/' ./db-postgresql homelab-docker-vm1:~/code/devops/
