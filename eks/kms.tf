#Added on 06/09/23 after having issues with an existing kms not being deleted and blocking a new one with a similar name. So need to practice using.

module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "1.1.0"

  aliases               = ["eks/module.eks.cluster_name"]
  description           = "${local.name} cluster encryption key"
  enable_default_policy = true
  key_owners            = [data.aws_caller_identity.current.arn]

  tags = local.tags
}
