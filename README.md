# Create a build VM on DigitalOcean

This code is meant to build a new VM from scratch each time it is run. So, it's
not fully idempotent. Don't try and use it to maintain a long-lived VM.

## Pre-requisites

* Terraform 0.14.5
* Ansible 2.10.5
* ssh-agent <-- to not have to push ssh keys to the VM
* github PAC <-- to use `gh`
* DigitalOcean account

## To use:

* Create an API key on DigitalOcean
* Create a PAC on GitHub
* export them as per dot.env.example
* Set user information in `ansible-playbooks/vars/default.yml`
* `make buildvm`

> need a pause between terraform and ansible, or you get this error:
```
"E: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 2308 (apt-get)", "E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), is another process using it?"
```

* `make ssh-david`
* `tmux`

Now you should be able to checkout git repos and build docker images.

Paste PAC and choose SSH protocol

## Cleanup

> Remember to `make destroy` when finished.
