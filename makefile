TERRAFORM := terraform
SSH_KEY := ~/.ssh/digitalocean_buildvm
SCP_OPTIONS := -i $(SSH_KEY) -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no
SSH_OPTIONS := -A $(SCP_OPTIONS)

# > You need a pause between terraform and ansible, or you get this error:
# ```
# "E: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 2308 (apt-get)", "E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), is another process using it?"
# ```
buildvm:
	source .env; \
		make init; \
		make apply; \
		sleep 60; \
		./ansible.sh

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
	bash -c ". .env; $(TERRAFORM) apply -auto-approve"

fmt:
	$(TERRAFORM) fmt -recursive

destroy:
	bash -c ". .env; $(TERRAFORM) destroy"

ssh-root:
	ssh $(SSH_OPTIONS) root@$$(cat .ip)

ssh:
	ssh $(SSH_OPTIONS) david@$$(cat .ip)

scp:
	scp $(SCP_OPTIONS) david.sh david@$$(cat .ip):

doctl-auth:
	doctl auth init -t $$(echo $$TF_VAR_do_token)
