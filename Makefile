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

python:
	ansible-playbook playbooks/python_deps.yaml -i inventory.yaml --ask-become-pass
	ansible-playbook playbooks/python_utilities.yaml -i inventory.yaml

nerd_fonts:
	ansible-playbook playbooks/nerd_font.yaml -i inventory.yaml 

graphics:
	ansible-playbook playbooks/graphics_utils.yaml -i inventory.yaml --ask-become-pass

programs:
	ansible-playbook playbooks/programs.yaml -i inventory.yaml --ask-become-pass
