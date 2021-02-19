# Create a build VM on DigitalOcean

## To use:

* Create an API key on DigitalOcean
* export it as per dot.env.example
* `make apply`
* `make ssh`

## Set up user

* `make scp`
* `make ssh-david`
* `./david.sh` # Only needed once per VM
* `tmux`

Now you should be able to checkout git repos and build docker images.

### Enable sudo

To enable sudo, ssh as the root user and change the password for `david`

### Configure gh

`gh auth login`

Paste PAC and choose SSH protocol

## Cleanup

> Remember to `make destroy` when finished.

## TODO

* Moar automation (set up the user non-interactively - maybe ansible?)
* git config is not setup correctly
* usermod -a -G docker david # as root, then reboot - enable 'david' to run docker

## Ansible

TODO: figure out how to run playbooks from a parent directory
TODO: create a local inventory file automatically, via terraform
TODO: prevent the initial "are you sure you want to connect" step

* Create `inventory` file `ansible-playbooks/setup_ubuntu2004/inventory`
* `cd ansible-playbooks/setup_ubuntu2004/`
* `ansible-playbook playbook.yml -i inventory -l buildvm -u root`
