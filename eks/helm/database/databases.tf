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

Tip:

  Watch the deployment status using the command: kubectl get pods -w --namespace default

Services:

  echo Primary: mysql.default.svc.cluster.local:3306

Execute the following to get the administrator credentials:

  echo Username: root
  MYSQL_ROOT_PASSWORD=$(kubectl get secret --namespace default mysql -o jsonpath="{.data.mysql-root-password}" | base64 --decode)

To connect to your database:

  1. Run a pod that you can use as a client:

      kubectl run mysql-client --rm --tty -i --restart='Never' --image  docker.io/bitnami/mysql:8.0.29-debian-10-r21 --namespace default --env MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD --command -- bash

  2. To connect to primary service (read/write):

      mysql -h mysql.default.svc.cluster.local -uroot -p"$MYSQL_ROOT_PASSWORD"

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
