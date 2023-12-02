
SHELL:=/bin/bash

venv:
	python3 -m venv venv
	source venv.sh && pip install -r requirements.txt

archive:
	bash archive.sh

extract:
	bash extract.sh 



