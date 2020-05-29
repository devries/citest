FROM python:3.8-slim as base

RUN pip install "poetry==1.0.5"

WORKDIR /code
COPY poetry.lock pyproject.toml /code/

RUN poetry install --no-interaction --no-ansi --no-root

COPY . /code

# Run test suite
RUN poetry run pytest && poetry run safety check

# Build
RUN poetry build

# Deploy in a container
FROM python:3.8-alpine3.11
COPY --from=base /code/dist /dist
RUN pip install /dist/*.whl

RUN /bin/rm -rf /dist
CMD ["cit"]
