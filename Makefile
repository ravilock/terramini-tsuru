VAR_FILE=local.tfvars

.PHONY: plan
plan:
	KUBE_SERVER=$(KUBE_SERVER) \
	KUBE_CA=$(KUBE_CA) \
	KUBE_CLIENT_CERT=$(KUBE_CLIENT_CERT) \
	KUBE_CLIENT_KEY=$(KUBE_CLIENT_KEY) \
	terraform plan -var-file=$(VAR_FILE) \
	-var="kube_server=$$KUBE_SERVER" \
	-var="kube_ca=$$KUBE_CA" \
	-var="kube_client_cert=$$KUBE_CLIENT_CERT" \
	-var="kube_client_key=$$KUBE_CLIENT_KEY" \

.PHONY: apply
apply:
	KUBE_SERVER=$(KUBE_SERVER) \
	KUBE_CA=$(KUBE_CA) \
	KUBE_CLIENT_CERT=$(KUBE_CLIENT_CERT) \
	KUBE_CLIENT_KEY=$(KUBE_CLIENT_KEY) \
	terraform apply -var-file=$(VAR_FILE) \
	-var="kube_server=$$KUBE_SERVER" \
	-var="kube_ca=$$KUBE_CA" \
	-var="kube_client_cert=$$KUBE_CLIENT_CERT" \
	-var="kube_client_key=$$KUBE_CLIENT_KEY" \
	--auto-approve

.PHONY: destroy
destroy:
	terraform destroy -var-file=$(VAR_FILE)
