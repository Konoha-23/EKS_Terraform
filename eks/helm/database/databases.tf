Ref MYSQL: https://artifacthub.io/packages/helm/bitnami/mysql
#Focus on configurations that can be used as set values
Ref MongoDB: https://artifacthub.io/packages/helm/bitnami/mongodb
---
resource "helm_release" "mysql" {
  name       = "mysql"
  namespace  = "default"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mysql"

  set {
    name = "primary.persistence.existingClaim" #only works with existing volume claim. Using existing storageclass like below will provision a volume but the container won't become ready.
    value = "ebs-pvc"
  }
}

resource "helm_release" "mongo" {
  name       = "mongo"
  namespace  = "default"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mongodb" #if named "mongo" it will not work

  set {
    name = "persistence.storageClass"
    value = "ebs-sc2"
  }
  set {
    name = "auth.rootPassword"
    value = "devdb@123"
  }
}
