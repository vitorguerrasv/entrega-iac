ENV_DIR=environments/dev

init:
	terraform -chdir=$(ENV_DIR) init -backend-config=backend.hcl

fmt:
	terraform fmt -recursive

validate:
	terraform -chdir=$(ENV_DIR) validate

plan:
	terraform -chdir=$(ENV_DIR) plan

apply:
	terraform -chdir=$(ENV_DIR) apply

destroy:
	terraform -chdir=$(ENV_DIR) destroy
