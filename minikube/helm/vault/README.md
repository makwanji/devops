# Vault

# Install Vault
```bash
kubectl create ns vault
helm repo add hashicorp https://helm.releases.hashicorp.com
helm install vault hashicorp/vault -n vault -f values.yaml
helm status vault
helm get manifest vault
```

## Upgrade helm

```bash
helm upgrade vault hashicorp/vault -n vault -f values.yaml
```

