# Kafka add user

```bash

# Exec into the Kafka container
docker exec -it kafka bash

# Create user 'appuser' with password 'app-pass'
kafka-configs --zookeeper zookeeper:2181 \
  --alter --add-config 'SCRAM-SHA-512=[password=app-pass]' \
  --entity-type users --entity-name appuser

# Verify
kafka-configs --zookeeper zookeeper:2181 --describe --entity-type users
```

## App usage

```yaml
# application.yml
spring:
  kafka:
    bootstrap-servers: skpsg-elastic.zh.adnovum.ch:9092
    properties:
      security.protocol: SASL_PLAINTEXT
      sasl.mechanism: SCRAM-SHA-512
      sasl.jaas.config: org.apache.kafka.common.security.scram.ScramLoginModule required \
        username="appuser" \
        password="app-pass";
```

### Logs

```txt

[appuser@fd37797427b0 ~]$ kafka-configs --zookeeper zookeeper:2181 --describe --entity-type users
Warning: --zookeeper is deprecated and will be removed in a future version of Kafka.
Use --bootstrap-server instead to specify a broker to connect to.
[2025-09-24 02:22:34,869] WARN SASL configuration failed. Will continue connection to Zookeeper server without SASL authentication, if Zookeeper server allows it. (org.apache.zookeeper.ClientCnxn)
javax.security.auth.login.LoginException: No JAAS configuration section named 'Client' was found in specified JAAS configuration file: '/etc/kafka/kafka_server_jaas.conf'.
        at org.apache.zookeeper.client.ZooKeeperSaslClient.<init>(ZooKeeperSaslClient.java:190)
        at org.apache.zookeeper.ClientCnxn$SendThread.startConnect(ClientCnxn.java:1157)
        at org.apache.zookeeper.ClientCnxn$SendThread.run(ClientCnxn.java:1207)
[2025-09-24 02:22:34,880] ERROR [ZooKeeperClient ConfigCommand] Auth failed, initialized=false connectionState=CONNECTING (kafka.zookeeper.ZooKeeperClient)
Configs for user-principal 'appuser' are SCRAM-SHA-512=salt=MWVuYmVnd25yYTQ1a3JpYzBtazY5NHIwcDI=,stored_key=YNFYI92v2jGuG4pZxZLSTR+L9F7ma1eYegiFcHmlfVZg2CzLP0boJkoLWwz+Y1XRKthxtgmw6MtHmjwdp8x4DQ==,server_key=0c+tQzof45EkT97zEWwVKxftxBfAL/y1CbNmZv4vv2WNE1of0UMPsdCovhNUe+Vb4QEwfAHogZGKnmbWzt1uLg==,iterations=4096
jignesh@skpsg-elastic:/u01/cp-kafka>

```