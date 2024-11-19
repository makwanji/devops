# mlflow stack

```bash
# Start stack
docker-compose up -d --build
```

## DB Create

```bash
# psql -U postgres
postgres=# CREATE DATABASE mlflow;
CREATE DATABASE
postgres-# \q

postgres=# \l
                                                    List of databases
   Name    |  Owner   | Encoding | Locale Provider |  Collate   |   Ctype    | Locale | ICU Rules |   Access privileges
-----------+----------+----------+-----------------+------------+------------+--------+-----------+-----------------------
 mlflow    | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           |
 postgres  | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           |
 template0 | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           | =c/postgres          +
           |          |          |                 |            |            |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |        |           | =c/postgres          +
           |          |          |                 |            |            |        |           | postgres=CTc/postgres
(4 rows)

postgres=# exit
```

## App

MLFlow UI: http://localhost:5001
MinIO Console: http://localhost:9001
PostgreSQL: localhost:5432 with postgres as username and password

## ALB - Entrypoint

https://minio.adnovumlabs.com
https://mlflow.adnovumlabs.com



# Refernce
https://erikdao.com/machine-learning/production-ready-mlflow-setup-in-your-local-machine/


aws --endpoint-url https://minio.adnovumlabs.com s3 ls

