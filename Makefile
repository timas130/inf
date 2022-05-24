default: apply

~/.terraform.d/credentials.tfrc.json:
	terraform login

terraform.tfvars:
	ansible-playbook tfvars.yml

.terraform.lock.hcl: ~/.terraform.d/credentials.tfrc.json versions.tf terraform.tfvars
	terraform init
	touch .terraform.lock.hcl

plan: .terraform.lock.hcl
	terraform plan

apply: .terraform.lock.hcl
	terraform apply

