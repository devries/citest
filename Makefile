.PHONY: init lint test ci build clean

init:
	poetry install

lint:
	poetry run pylint citest

test:
	poetry run pytest

safety:
	poetry run safety check

ci: lint test safety

clean:
	rm -rf dist
	#rm -rf citest.egg-info

build: ci
	poetry build

image: clean
	docker build -t citest .
