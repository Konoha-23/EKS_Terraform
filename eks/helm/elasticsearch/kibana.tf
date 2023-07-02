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
