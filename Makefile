SHELL=/bin/bash

ping:
	ansible all -i inventory -m ping

info:
	ansible all -i inventory -m gather_facts

setup-arch: base_utilities-arch ssh_config conf_repos

setup-debian: base_utilities-debian ssh_config conf_repos

base_utilities-%:
	ansible-playbook playbooks/base_utilities.yaml -i inventory --ask-become-pass -l `echo $@ | cut -d '-' -f2`

ssh_config:
	ansible-playbook playbooks/ssh_utilities.yaml -i inventory  > public_keys.txt

conf_repos:
	ansible-playbook playbooks/conf_repos.yaml -i inventory 
