#!/bin/bash

set -euo pipefail

ANSIBLE_HOST_KEY_CHECKING=False \
  ansible-playbook -u root \
  -i "${ip}," \
  --private-key ${private_key_file} \
  -e pub_key=${private_key_file}.pub \
  ansible-playbooks/*.yml
