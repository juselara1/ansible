SHELL=/bin/bash

ping:
	ansible all -i inventory -m ping

info:
	ansible all -i inventory -m gather_facts

setup-arch: base_utilities-arch

setup-debian: base_utilities-debian

base_utilities-%:
	ansible-playbook playbooks/base_utilities.yaml -i inventory --ask-become-pass -l `echo $@ | cut -d '-' -f2`
