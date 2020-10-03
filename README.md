# citest
![CI](https://github.com/devries/citest/workflows/CI/badge.svg?branch=master)

A test of CI tools w/ poetry

Essentially this project can be tested and validated for package vulnerabilities using the following sequence:
- `poetry install`
- `poetry run pytest`
- `poetry run safety check`

There are two methods for automating this using google cloud build and github respectively:

1. Using cloud build set up a trigger to run the `cloudbuild.yaml` file. This can be run manually using the command:

```
gcloud builds submit --config cloudbuild.yaml .
```

2. There is a github action in the `.github/workflows/main.yml` directory. This should run automatically.

# Run the sample

You can run this project using the command below:

```
poetry run cit
```
