PIP_BREAK_SYSTEM_PACKAGES := 1

VENV := venv
REQUIREMENTS_FILE := requirements.txt
INSTALL_DIR := install
PYTHON_BIN := python
ASDF_HTML_URL := https://github.com/asdf-vm/asdf/releases/download/v0.18.0/asdf-v0.18.0-linux-amd64.tar.gz
ASDF_BIN := ./bin/asdf
HOME_BIN := ~/.bin
ANSIBLE_ROOT := ansible

ONLY_MODULE ?=
EXTRA_ARGS ?=
ifdef ONLY_MODULE
EXTRA_ARGS := --extra-vars "only_module=$(ONLY_MODULE)"
endif

.PHONY: provisioning

install: $(INSTALL_DIR)/.venv.stamp $(INSTALL_DIR)/.precommit.stamp

$(INSTALL_DIR)/.dir.stamp:
	mkdir -p $(INSTALL_DIR)
	touch $@

$(INSTALL_DIR)/.venv.stamp: $(REQUIREMENTS_FILE) $(INSTALL_DIR)/.dir.stamp $(INSTALL_DIR)/.asdf.python.stamp
	test -d "$(VENV)" || $(PYTHON_BIN) -m venv "$(VENV)"
	. "$(VENV)/bin/activate"; \
		pip install --upgrade pip; \
		pip install -r "$(REQUIREMENTS_FILE)"
	touch $@

$(INSTALL_DIR)/.precommit.stamp: $(PRECOMMIT_FILE) $(INSTALL_DIR)/.venv.stamp
	. "$(VENV)/bin/activate"; pre-commit install
	touch $@

$(INSTALL_DIR)/.asdf.stamp:
	mkdir -p ./bin
	wget -q -O- $(ASDF_HTML_URL) | tar -xz -C ./bin
	touch $@

$(INSTALL_DIR)/.asdf.shell.stamp: $(INSTALL_DIR)/.asdf.stamp
	echo 'export PATH="$${ASDF_DATA_DIR:-$$HOME/.asdf}/shims:$$PATH"' >> ~/.bash_profile
	mkdir -p $(HOME_BIN)
	cp $(ASDF_BIN) $(HOME_BIN)/
	echo 'export PATH="$$HOME/.bin:$$PATH"' >> ~/.bash_profile
	touch $@

$(INSTALL_DIR)/.asdf.python.stamp: $(INSTALL_DIR)/.asdf.shell.stamp
	$(ASDF_BIN) plugin add python \
		"https://github.com/asdf-community/asdf-python.git"
	$(ASDF_BIN) install python 3.9.0
	$(ASDF_BIN) set python 3.9.0
	touch $@

provisioning: $(INSTALL_DIR)/.venv.stamp
	. "$(VENV)/bin/activate"; cd "$(ANSIBLE_ROOT)" && $(MAKE) USER_FLAGS='$(EXTRA_ARGS)' $@

clean:
	r  -rf "$(VENV)" "$(INSTALL_DIR)"
