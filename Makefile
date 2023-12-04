
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


venv:
	python3 -m venv venv
	source venv.sh && pip install -r requirements.txt

archive:
	bash archive.sh

commit:
	bash commit.sh


extract:
	bash extract.sh 

cron:
	bash add-cron.sh


