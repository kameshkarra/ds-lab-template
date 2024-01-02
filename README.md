# ds-lab

## Tools used in this project
* [Poetry](https://towardsdatascience.com/how-to-effortlessly-publish-your-python-package-to-pypi-using-poetry-44b305362f9f): Dependency management - [article](https://mathdatasimplified.com/2023/06/12/poetry-a-better-way-to-manage-python-dependencies/)
* [hydra](https://hydra.cc/): Manage configuration files - [article](https://mathdatasimplified.com/2023/05/25/stop-hard-coding-in-a-data-science-project-use-configuration-files-instead/)
* [pre-commit plugins](https://pre-commit.com/): Automate code reviewing formatting. see [pre-commit-config.yaml](.pre-commit-config.yaml)
* [DVC](https://dvc.org/): Data version control - [article](https://mathdatasimplified.com/2023/02/20/introduction-to-dvc-data-version-control-tool-for-machine-learning-projects-2/)
* [pdoc](https://github.com/pdoc3/pdoc): Automatically create an API documentation for your project
* [conda-lock](https://github.com/conda/conda-lock): Lightweight library that can be used to generate fully reproducible lock files for conda environments. [article](https://pythonspeed.com/articles/conda-dependency-management/)
* [Renovate](https://docs.renovatebot.com): For automated dependency updates. Multi-platform and multi-language.
* GitHub Action Workflows: For continous integration. See [python-package-conda.yml](.github/workflows/python-package-conda.yml)
* Make: To automate conda environment creation and installation of Poetry. See [Makefile](Makefile)

## Set up the environment

1. Install [anaconda](https://www.anaconda.com/download)
2. Set up the environment:
```bash
make env
```
## Dependnecy management
Conda is used create conda environment with Python and Poetry, see [environment.yml](environment.yml). Conda-lock is used to create lock files for multiple platforms, see [conda-lock.yml](conda-lock.yml). To create conda-lock.yml
```bash
make conda-lock
```
Poetry is used to manage the rest of the application dependencies, see [pyproject.toml](pyproject.toml)

## Install dependencies
To install all dependencies for this project, run:
```bash
poetry install
```

To install a new package, run:
```bash
poetry add <package-name>
```

## Version your data
To track changes to the "data" directory, type:
```bash
dvc add data
```

This command will create the "data.dvc" file, which contains a unique identifier and the location of the data directory in the file system.

To keep track of the data associated with a particular version, commit the "data.dvc" file to Git:
```bash
git add data.dvc
git commit -m "add data"
```

To push the data to remote storage, type:
```bash
dvc push
```

## Auto-generate API documentation

To auto-generate API document for your project, run:

```bash
make docs
```
