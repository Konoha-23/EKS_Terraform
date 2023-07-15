Ref: https://github.com/kubernetes-sigs/aws-efs-csi-driver/blob/master/docs/iam-policy-create.md

resource "helm_release" "efs" {
  name       = "efs"
  namespace  = "kube-system"
  repository = "https://kubernetes-sigs.github.io/aws-efs-csi-driver/"
  chart      = "aws-efs-csi-driver"

    set {
    name  = "controller.serviceAccount.create"
    value = "false"
  } 

  set {
    name  = "controller.serviceAccount.name"
    value = "efs-csi-controller-sa"
  }
}

EFS Driver Policy: arn:aws:iam::aws:policy/aws-service-role/AmazonElasticFileSystemServiceRolePolicy
