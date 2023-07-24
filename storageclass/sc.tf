resource "kubernetes_storage_class" "ebs-sc" {
  metadata {
    name = "ebs-sc"
  }
  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy      = "Retain"
  volume_binding_mode = "Immediate"
  parameters = {
    type = "gp2"
  }
}
