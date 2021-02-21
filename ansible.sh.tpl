#!/bin/bash

set -euo pipefail

ansible-playbook -u root \
  -i "${ip}," \
  --private-key ${private_key_file} \
  -e pub_key=${private_key_file}.pub \
  ansible-playbooks/playbook.yml ansible-playbooks/non-root.yml
