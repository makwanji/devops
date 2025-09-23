# MySQL Database

## Create DB
```bash
CREATE DATABASE autoshipdb;
CREATE USER 'autoship'@'%' IDENTIFIED BY 'YourStrongPassword';
GRANT ALL PRIVILEGES ON autoshipdb.* TO 'autoship'@'%';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'autoship'@'%';
```
