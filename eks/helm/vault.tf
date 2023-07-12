Install Vault to EKS via Helm Ref: https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-amazon-eks

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
