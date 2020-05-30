.PHONY: init update lint test ci build clean image help
.DEFAULT_GOAL := help

init: ## Install dependencies and make virtual environment if necessary
	poetry install

update: ## Update dependencies
	poetry update

lint: ## Run linter
	poetry run pylint citest

test: ## Run unit tests
	poetry run pytest

safety: ## Check for vulnerabilities in dependencies
	poetry run safety check

ci: lint test safety ## Run linter, testing, and vulnerability scan

clean: ## Remove any build artifacts
	rm -rf dist
	#rm -rf citest.egg-info

build: ci ## Test and build project
	poetry build

image: clean ## Test and build project in Docker image from scratch
	docker build -t citest .

help:
	@echo "This project is a CI testing project with integration for github, gitlab, and Google source repositories.\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
