TERRAFORM := terraform-0.14.5

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
