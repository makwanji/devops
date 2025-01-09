# Consul

```bash
# Put keys
docker exec -it consul-server consul kv put config/db_host 192.168.2.11
docker exec -it consul-server consul kv put config/db_port 3306
# Get keys
docker exec -it consul-server consul kv get config/db_host
docker exec -it consul-server consul kv get config/db_port
```

