FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN opendata_collector create-db
RUN opendata_collector populate-db
RUN opendata_collector add-user -u admin -p admin
EXPOSE 5000
CMD ["opendata_collector", "run"]
