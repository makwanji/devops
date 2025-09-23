# PostgreSQL Database setup

## Create Database and user

```bash
# Create user
docker exec -it postgres bash

postgres@0d992a699111:~$ psql -U user -d pgdb
psql (17.6 (Debian 17.6-1.pgdg13+1))
Type "help" for help.

pgdb=# \du
                             List of roles
 Role name |                         Attributes
-----------+------------------------------------------------------------
 n8n       |
 sonar     |
 user      | Superuser, Create role, Create DB, Replication, Bypass RLS

pgdb=# CREATE DATABASE sonarqube;
ERROR:  database "sonarqube" already exists

pgdb=# CREATE USER sonar WITH ENCRYPTED PASSWORD 'son#ar#123';
ERROR:  role "sonar" already exists

pgdb=# GRANT ALL PRIVILEGES ON DATABASE sonarqube TO sonar;
GRANT

pgdb=# \c sonarqube
You are now connected to database "sonarqube" as user "user".

sonarqube=# ALTER SCHEMA public OWNER TO sonar;
ALTER SCHEMA

sonarqube=# GRANT ALL ON SCHEMA public TO sonar;
GRANT

sonarqube=#
```

## Drop database

```bash
DROP DATABASE sonarqube_db;
```