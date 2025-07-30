# grafana

# Install Nexus
```bash
kubectl create ns grafana
helm repo add grafana https://grafana.github.io/helm-charts
helm install grafana grafana/grafana -n grafana -f values.yaml
```

## Upgrade helm

```bash
helm upgrade grafana grafana/grafana -n grafana -f values.yaml
```
