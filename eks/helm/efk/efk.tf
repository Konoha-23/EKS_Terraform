Elasticsearch requires a minimum of 4cpu cores meaning instance types in the xlarge category e.g t2.xlarge, t3.xlarge
ref: https://opster.com/guides/elasticsearch/capacity-planning/elasticsearch-minimum-requirements/#:~:text=CPU,for%20indexing%20and%20search%20operations.
Kibana relies on elastic search and doesn't have a cpu requirement however if all pods are not running, it will not function.
---
resource "helm_release" "elasticsearch" {
  name       = "elasticsearch"
  create_namespace = true
  namespace  = "efk"
  repository = "https://helm.elastic.co"
  chart      = "elasticsearch"
}

resource "helm_release" "kibana" {
  name       = "kibana"
  create_namespace = true
  namespace  = "efk"
  repository = "https://helm.elastic.co"
  chart      = "kibana"
}

resource "helm_release" "filebeat" {
  name       = "filebeat"
  create_namespace = true
  namespace  = "efk"
  repository = "https://helm.elastic.co"
  chart      = "filebeat"
}

helm install elasticsearch elastic/elasticsearch
   It will deploy elasticsearch in the default namespace 
   It will deploy elasticsearch using default value file 
helm install elasticsearch elastic/elasticsearch \
  -n efk -f elasticsearch.values

NOTES:
1. Watch all containers come up.
  $ kubectl get pods --namespace=efk -l release=kibana1 -w
#2. Retrieve the elastic username
 # $ kubectl get secrets --namespace=efk elasticsearch-master-credentials -ojsonpath='{.data.username}' | base64 -d
3. Retrieve the elastic user's password.
  $ kubectl get secrets --namespace=efk elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d
4. Retrieve the kibana service account token.
  $ kubectl get secrets --namespace=efk kibana1-kibana-es-token -ojsonpath='{.data.token}' | base64 -d

# ingress2.yml
apiVersion: extensions/v1beta1  # networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-rule-1
  namespace: efk
spec:
  ingressClassName: nginx
  rules:
  - host: kibana.dominionsystem.net
    http:
      paths:
      - backend:
          serviceName: kibana-kibana
          servicePort: 5601
