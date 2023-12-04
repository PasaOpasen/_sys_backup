
SHELL:=/bin/bash

SCRIPT_VERSION=v1.0
SCRIPT_AUTHOR=qtckpuhdsa@gmail.com

HELP_FUN = \
    %help; while(<>){push@{$$help{$$2//'options'}},[$$1,$$3] \
    if/^([\w-_]+)\s*:.*\#\#(?:@(\w+))?\s(.*)$$/}; \
    print"$$_:\n", map"  $$_->[0]".(" "x(20-length($$_->[0])))."$$_->[1]\n",\
    @{$$help{$$_}},"\n" for keys %help; \

help: ##@Miscellaneous Show this help
	@echo -e "Usage: make [target] ...\n"
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)
	@echo -e "\nWritten by $(SCRIPT_AUTHOR), version $(SCRIPT_VERSION)"


archive:  ##@Packing update storage files
	bash archive.sh

commit:   ##@Packing commit changes
	bash commit.sh

cron:     ##@Packing add cron job for storage files auto updates
	bash add-cron.sh	


venv:    ##@Unpacking create necessary venv to call Ansible
	python3 -m venv venv
	source venv.sh && pip install -r requirements.txt

extract: ##@Unpacking perform storage files extraction
	bash extract.sh 



