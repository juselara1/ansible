SHELL=/bin/bash

ping:
	ansible all -i inventory.yaml -m ping

info:
	ansible all -i inventory.yaml -m gather_facts

base_utilities:
	ansible-playbook playbooks/base_utilities.yaml -i inventory.yaml --ask-become-pass

ssh_config:
	ansible-playbook playbooks/ssh_utilities.yaml -i inventory.yaml > public_keys.txt

conf_repos:
	ansible-playbook playbooks/conf_repos.yaml -i inventory.yaml 
nvim:
	ansible-playbook playbooks/nvim.yaml -i inventory.yaml --ask-become-pass
