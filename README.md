# Create a build VM on DigitalOcean

## To use:

* Create an API key on DigitalOcean
* export it as per dot.env.example
* `make apply`
* `make ssh`

## Set up user

* `make scp`
* `make ssh-david`
* `./david.sh`

To enable sudo, ssh as the root user and change the password for `david`

Now you should be able to checkout git repos and build docker images.

> Remember to `make destroy` when finished.

## TODO

* git config is not setup correctly
