Here’s a **step-by-step guide to installing SonarQube via Helm**:

---

### **1. Prerequisites**

* Kubernetes cluster running (v1.24+ recommended)
* `kubectl` configured to access your cluster
* Helm v3 installed
* At least 4 vCPUs & 8GB RAM for the SonarQube pod (recommended)
* Persistent volume provisioner available in your cluster

---

### **2. Create Namespace**

```bash
kubectl create namespace sonarqube
```

---

### **3. Add the SonarQube Helm Repository**

```bash
helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo update
```

---

### **4. Install SonarQube with Default Values**

```bash
helm install sonarqube sonarqube/sonarqube -n sonarqube
```

This will:

* Deploy SonarQube with a default PostgreSQL database (using an embedded chart)
* Create a ClusterIP service

---

### **5. Customize (Optional)**

To customize, first get the default values:

```bash
helm show values sonarqube/sonarqube > values.yaml

# TODO: Update this value

```

Edit `values.yaml` to:

* Configure external PostgreSQL DB (for production)
* Enable ingress
* Adjust resources and persistent volumes

Install using:

```bash
helm install sonarqube sonarqube/sonarqube -n sonarqube -f values.yaml
```

---

### **6. Check Installation**

```bash
kubectl get pods -n sonarqube
```

You should see a pod like `sonarqube-0` running.

---

### **7. Access SonarQube UI**

By default, the `sonarqube` service is a ClusterIP.
Use port-forwarding:

```bash
kubectl port-forward svc/sonarqube -n sonarqube 9000:9000
```

Then open:

```
http://localhost:9000
```

**Default credentials:**

* **Username:** `admin`
* **Password:** `admin`

---

### **8. (Optional) Expose Externally**

Change service type to LoadBalancer:

```bash
kubectl patch svc sonarqube -n sonarqube -p '{"spec": {"type": "LoadBalancer"}}'
```

Or enable ingress in `values.yaml`:

```yaml
ingress:
  enabled: true
  hosts:
    - name: sonarqube.example.com
      path: /
```

---

Would you like me to give you a **“production-ready” SonarQube Helm install (external PostgreSQL + ingress + persistent storage)** in a **single YAML file** so you can just apply it?
I can generate that next. Should I proceed?
