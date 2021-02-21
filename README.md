# Create a build VM on DigitalOcean

## To use:

* Create an API key on DigitalOcean
* export it as per dot.env.example
* `make apply`
* `./ansible.sh`
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

* git config is not setup correctly
* usermod -a -G docker david # as root, then reboot - enable 'david' to run docker
* install neovim plugins non-interactively, so I don't have to do it myself when I launch nvim for the first time

