FROM bitnami/spark:3.3.1
WORKDIR /opt/spark
COPY . .
CMD ["spark-submit", "--master", "local[*]", "--jars", "/opt/spark/jars/postgresql-42.2.18.jar", "/opt/spark/notebooks/etl_case.py"]