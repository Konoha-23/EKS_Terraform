Install Vault to EKS via Helm Ref: https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-amazon-eks
Inject Kubernetes Secrets: https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-sidecar
Agent-Injector-Sidecar Annotations Ref: https://developer.hashicorp.com/vault/docs/platform/k8s/injector#annotations 
Update as of 01/2024
Follow Process in reference to setup Vault Cluster after installation

resource "helm_release" "vault" {
  name       = "vault"
  namespace  = "default"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"

    set {
    name  = "server.ha.enabled"
    value = "true"
  }

  set {
    name  = "server.ha.raft.enabled"
    value = "true"
  }
}


To get the root token needed to log in from the website.
cat cluster-keys.json | jq -r ".root_token"
