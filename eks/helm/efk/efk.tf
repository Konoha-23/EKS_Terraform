---
resource "helm_release" "elastic" {
  name       = "elastic"
  create_namespace = true
  namespace  = "efk"
  repository = "https://helm.elastic.co"
  chart      = "elasticsearch"
}

helm install elasticsearch elastic/elasticsearch
   It will deploy elasticsearch in the default namespace 
   It will deploy elasticsearch using default value file 
helm install elasticsearch elastic/elasticsearch \
  -n efk -f elasticsearch.values

NOTES:
1. Watch all containers come up.
  $ kubectl get pods --namespace=efk -l release=kibana1 -w
2. Retrieve the elastic user's password.
  $ kubectl get secrets --namespace=efk elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d
3. Retrieve the kibana service account token.
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
