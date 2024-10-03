# OCP Commands


```bash
# get credentials
crc console --credentials

# create new project
oc new-project jig

# get projects
oc projects | grep jig

# Describe projects
oc describe project jig


# Cluster operator
oc get clusteroperators

# get pods
oc get pods
```


## Group

```bash
# create a group
oc adm groups new dev

# list group
oc adm get groups
```
