# Install ArgoCD

```bash
# Install Helm
helm upgrade --install -n argocd argocd argo/argo-cd --version=8.2.2 -f values.yaml --create-namespace
```
