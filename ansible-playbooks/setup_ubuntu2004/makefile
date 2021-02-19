apply-playbook:
	ssh-add ~/.ssh/digitalocean_buildvm # TODO: supply via terraform?
	ansible-playbook playbook.yml -i inventory -l buildvm -u root
