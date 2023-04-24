output "endpoint" {
  value = aws_eks_cluster.Hogwarts.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.Hogwarts.certificate_authority[0].data
}

output "kubeconfig-token" {
  value = aws_eks_cluster_auth.Hogwarts.token
}
