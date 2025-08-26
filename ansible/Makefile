CHECK_FLAGS := --check --diff
USER_FLAGS ?=
ADDITIONAL_FLAGS ?= $(USER_FLAGS)
ANSIBLE_EXTRA_ENV ?=

ifeq ($(MODE),debug)
	override ADDITIONAL_FLAGS := $(USER_FLAGS) $(CHECK_FLAGS) -vv
	override ANSIBLE_EXTRA_ENV := ANSIBLE_DISPLAY_OK_HOSTS=no ANSIBLE_DISPLAY_SKIPPED_HOSTS=no
endif

ANSIBLE_BASE := ansible-playbook
ANSIBLE_GALAXY_BASE := ansible-galaxy
ANSIBLE_GALAXY_REQUIREMENTS := requirements.yml

install: $(ANSIBLE_GALAXY_REQUIREMENTS)
	$(ANSIBLE_GALAXY_BASE) collection install \
		-r $(ANSIBLE_GALAXY_REQUIREMENTS)

provisioning: install
	$(ANSIBLE_EXTRA_ENV) $(ANSIBLE_BASE) playbooks/provisioning.yaml \
		--ask-become-pass \
		$(ADDITIONAL_FLAGS)
