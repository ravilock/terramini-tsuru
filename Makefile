VAR_FILE=local.tfvars

.PHONY: plan
plan:
	terraform plan -var-file=$(VAR_FILE)

.PHONY: apply
apply:
	terraform apply -var-file=$(VAR_FILE) --auto-approve

.PHONY: destroy
destroy:
	terraform destroy -var-file=$(VAR_FILE)
