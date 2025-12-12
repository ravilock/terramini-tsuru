.PHONY: local-plan
local-plan:
	terraform plan -var-file=local.tfvars

.PHONY: local-apply
local-apply:
	terraform apply -var-file=local.tfvars

.PHONY: local-destroy
local-destroy:
	terraform destroy -var-file=local.tfvars
