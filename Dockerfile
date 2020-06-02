FROM python:3.8-alpine3.11
COPY dist /dist
RUN pip install /dist/*.whl

RUN /bin/rm -rf /dist
CMD ["cit"]
