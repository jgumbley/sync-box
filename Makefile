define green
	@tput setaf 2
	@tput bold
	@echo $1
	@tput sgr0
endef

in_venv=venv/bin/activate
.PHONY: default¬

default: venv
	$(call green,"[Build successful]")

all: default local_device_tests
	$(call green,"[Build with device tests successful]")

venv: venv/bin/activate
venv/bin/activate: requirements.txt
	test -d venv || virtualenv venv
	. venv/bin/activate; pip install -r requirements.txt
	touch venv/bin/activate
	$(call green,"[Making venv successful]")

