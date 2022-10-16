#!/bin/bash

set -euo pipefail

source .env

if !(ps -p $SSH_AGENT_PID > /dev/null); then
  echo "ssh-agent $SSH_AGENT_PID is not running. Exiting."
  exit 1
fi

ansible-playbook -u root \
  -i "${ip}," \
  --private-key ${private_key_file} \
  -e pub_key=${private_key_file}.pub \
  ansible-playbooks/playbook.yml ansible-playbooks/non-root.yml
