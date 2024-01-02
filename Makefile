.DEFAULT_GOAL : build
.PHONY: env tests docs build clean

envname = ds-lab-template
pythonversion = 3.11.5
CONDA ?= $(CONDA_PREFIX)

build: install tests

env:
	conda create --name=$(envname) python=$(pythonversion)
	. $(CONDA)/etc/profile.d/conda.sh && \
	conda activate $(envname) && \
	conda install --channel=conda-forge --name $(envname) conda-lock &&\
	conda-lock install --name $(envname) conda-lock.yml &&\
	poetry lock && \
	poetry install &&\
	poetry run pre-commit

tests:
	@echo "Running tests..."
	. $(CONDA)/etc/profile.d/conda.sh && \
	conda activate $(envname) && \
	poetry run pytest

docs:
	@echo Save documentation to docs...
	pdoc src -o docs --force
	@echo View API documentation...
	pdoc src --http localhost:8080

clean:
	conda remove --name $(envname) --all

conda-lock:
	. $(CONDA)/etc/profile.d/conda.sh && \
	conda activate $(envname) && \
	conda-lock -f environment.yml
