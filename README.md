# Create a build VM on DigitalOcean

This code is meant to build a new VM from scratch each time it is run. So, it's
not fully idempotent. Don't try and use it to maintain a long-lived VM.

## Pre-requisites

* ssh-agent <-- in order not to have to push ssh keys to the VM  # see ~/INIT-SSH.sh
* Terraform >= 0.14.5
* Ansible >= 2.10.5
* github PAC <-- to use `gh`
* DigitalOcean account
* Namecheap Dynamic DNS host record <-- to always use the same DNS entry for the new VM

## To use:

* Create an API key on DigitalOcean
* Create a PAC on GitHub
* Create a Dynamic DNS entry on Namecheap
* export them as per dot.env.example
* Set user information in `ansible-playbooks/vars/default.yml`
* Edit `main.tf` to set the size of VM to create
* Customise the software to install in
  - `ansible-playbooks/playbook.yml`
  - `ansible-playbooks/non-root.yml`
* `make buildvm`

### Start working on the VM

* `make ssh`
* `tmux`

Now you should be able to checkout git repos and build docker images.

## Cleanup

> Remember to `make destroy` when finished.

## TODO

- Add brownie for solidity development
- Add a list of projects, along with code to clone them and install any required dependencies (e.g. yarn/npm packages). The initialisation code should be in the actual projects, as `make setup` or something.
