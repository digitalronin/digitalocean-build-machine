apply-playbooks:
	ssh-add ~/.ssh/digitalocean_buildvm # TODO: supply via terraform?
	ansible-playbook *.yml -i inventory -l buildvm -u root
