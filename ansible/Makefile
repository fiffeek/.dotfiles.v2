CHECK_FLAGS := --check --diff
ADDITIONAL_FLAGS ?=

ifeq ($(mode),debug)
	override ADDITIONAL_FLAGS := $(CHECK_FLAGS) -vvvv
endif

ANSIBLE_BASE := ansible-playbook
ANSIBLE_GALAXY_BASE := ansible-galaxy
ANSIBLE_GALAXY_REQUIREMENTS := requirements.yml

.PHONY: provisioning

install: $(ANSIBLE_GALAXY_REQUIREMENTS)
	$(ANSIBLE_GALAXY_BASE) collection install \
		-r $(ANSIBLE_GALAXY_REQUIREMENTS)

provisioning: install
	$(ANSIBLE_BASE) playbooks/provisioning.yaml \
		--ask-become-pass \
		$(ADDITIONAL_FLAGS)
