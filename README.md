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
* usermod -a -G docker david # as root - enable 'david' to run docker
