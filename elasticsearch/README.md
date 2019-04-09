# Elasticsearch

## Configure an upstream image stream & auth token

```
oc apply -f redhat-pull-secret.yaml
oc secrets link default redhat-pull-secret --for=pull
oc import-image my-bitnami/elasticsearch --from=registry.connect.redhat.com/bitnami/elasticsearch --confirm
```


## Build Cegeka elasticsearch image

```
oc new-build https://github.com/cegeka/openshift-templates --context-dir elasticsearch --to cegeka-elasticsearch:latest --name cegeka-elasticsearch
```

## Create required objects

```

export IS=$(oc get is | grep cegeka-elasticsearch | awk '{print $2}')
sed -i "s#__IS__#${IS}#" ocp/elasticsearch-deploymentconfig.yaml
oc apply -f ocp/elasticsearch-config.yaml
oc apply -f ocp/elasticsearch-deploymentconfig.yaml
```
