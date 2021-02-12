# Create a build VM on DigitalOcean

To use:

* Create an API key on DigitalOcean
* export it as per dot.env.example
* `make apply`
* `make ssh`

Now you should be able to checkout git repos and build docker images.

> Remember to `make destroy` when finished.
