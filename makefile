TERRAFORM := terraform-0.14.5
SSH_KEY := ~/.ssh/digitalocean_buildvm
SCP_OPTIONS := -i $(SSH_KEY) -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
SSH_OPTIONS := -A $(SCP_OPTIONS)

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
	$(TERRAFORM) apply -auto-approve

fmt:
	$(TERRAFORM) fmt -recursive

destroy:
	$(TERRAFORM) destroy

ssh:
	ssh $(SSH_OPTIONS) root@$$(cat .ip)

ssh-david:
	ssh $(SSH_OPTIONS) david@$$(cat .ip)

scp:
	scp $(SCP_OPTIONS) david.sh david@$$(cat .ip):

