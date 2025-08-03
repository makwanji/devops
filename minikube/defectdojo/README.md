# Install defectdojo


## Create namespace

```bash
kubectl create ns defectdojo
```

## Install Helm

```bash
DJANGO_INGRESS_ENABLED=fales
DJANGO_INGRESS_ACTIVATE_TLS=false

helm upgrade   defectdojo   -n defectdojo   ./helm/defectdojo   --set django.ingress.enabled=${DJANGO_INGRESS_ENABLED}   --set django.ingress.activateTLS=${DJANGO_INGRESS_ACTIVATE_TLS}   --set createSecret=true   --set createRedisSecret=true   --set createPostgresqlSecret=true   --set createPostgresqlSecret=true

```

## Upgrade helm
```bash
helm upgrade  defectdojo -n defectdojo ./helm/defectdojo/ \
   --set django.ingress.enabled=${DJANGO_INGRESS_ENABLED} \
   --set django.ingress.activateTLS=${DJANGO_INGRESS_ACTIVATE_TLS}
```

