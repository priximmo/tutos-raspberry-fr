#!/bin/bash

## Create and maintain users for Raspberry


ansible-playbook -i list_servers.yml -u pi -k -b users.yml
