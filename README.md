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

> This code is meant to build a new VM from scratch each time it is run. So,
> it's not fully idempotent. Don't try and use it to maintain a long-lived VM.

Paste PAC and choose SSH protocol

## Cleanup

> Remember to `make destroy` when finished.

## TODO

* git config is not setup correctly
* usermod -a -G docker david # as root, then reboot - enable 'david' to run docker
* install neovim plugins non-interactively, so I don't have to do it myself when I launch nvim for the first time

