.PHONY: tests docs

dependencies:
	@echo "Installing dependencies..."
	poetry install
	poetry run pre-commit

tests:
	poetry run pytest

docs:
	@echo Save documentation to docs...
	pdoc src -o docs --force
	@echo View API documentation...
	pdoc src --http localhost:8080
