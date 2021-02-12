TERRAFORM := terraform-0.14.5
SSH_KEY := ~/.ssh/digitalocean_buildvm

foo:
	curl -X GET \
		-H "Content-Type: application/json" \
		-H "Authorization: Bearer $${TF_VAR_do_token}" \
		"https://api.digitalocean.com/v2/images" | jq

init:
	$(TERRAFORM) init

plan:
	$(TERRAFORM) plan

apply:
	$(TERRAFORM) apply

fmt:
	$(TERRAFORM) fmt -recursive

destroy:
	$(TERRAFORM) destroy

ssh:
	IP=$$($(TERRAFORM) output droplet_ip | sed 's/"//g'); ssh -A -i $(SSH_KEY) root@$$IP

