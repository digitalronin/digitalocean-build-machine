TERRAFORM := terraform
SSH_KEY := ~/.ssh/digitalocean_buildvm
SCP_OPTIONS := -i $(SSH_KEY) -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
SSH_OPTIONS := -A $(SCP_OPTIONS)

# > You need a pause between terraform and ansible, or you get this error:
# ```
# "E: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 2308 (apt-get)", "E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), is another process using it?"
# ```
buildvm:
	. .env; make init; make apply; sleep 180; ./ansible.sh

list-do-images:
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
	. .env; $(TERRAFORM) destroy

ssh:
	ssh $(SSH_OPTIONS) root@$$(cat .ip)

ssh-david:
	ssh $(SSH_OPTIONS) david@$$(cat .ip)

scp:
	scp $(SCP_OPTIONS) david.sh david@$$(cat .ip):

doctl-auth:
	doctl auth init -t $$(echo $$TF_VAR_do_token)
