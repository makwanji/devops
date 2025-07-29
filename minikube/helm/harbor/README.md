# harbor

# Install Nexus
```bash
kubectl create ns harbor
helm repo add harbor https://helm.goharbor.io
helm install harbor harbor/harbor -n harbor -f values.yaml
```

## Upgrade helm

```bash
helm upgrade harbor harbor/harbor -n harbor -f values.yaml
```
