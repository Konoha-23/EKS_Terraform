resource "aws_eks_cluster" "Hogwarts" {

  name                      = var.cluster_name
  role_arn                  = aws_iam_role.Hogwarts.arn
  version                   = var.cluster_version

  vpc_config {
    security_group_ids      = var.vpc_security_group_id
    subnet_ids              = var.subnet_ids
    cluster_endpoint_public_access = true
  }
  
  depends_on = [
    aws_iam_role_policy_attachment.Hogwarts-AmazonEKSClusterPolicy, aws_iam_role_policy_attachment.Hogwarts-AmazonEKSVPCResourceController, 
    aws_iam_role_policy_attachment.Hogwarts-AmazonEKS_VPC_CNI, aws_iam_role_policy_attachment.Hogwarts-AmazonEKS_EBS_CSI_DRIVER, 
    aws_iam_role_policy_attachment.Hogwarts-AmazonEKS_SERVICE_POLICY, aws_iam_role_policy_attachment.Hogwarts-AmazonEKS_WORKERNODE_POLICY, 
    aws_iam_role_policy_attachment.Hogwarts-AmazonEKS_SECRET_MANAGER, aws_iam_role_policy_attachment.Hogwarts-AmazonEKS_EC2_FULLACCESS, 
    aws_iam_role_policy_attachment.Hogwarts-AmazonEKS_HEALTH_FULLACCESS, aws_iam_role_policy_attachment.Hogwarts-AmazonEKS_FARGATE
  ]

  }
}


resource "aws_eks_addon" "VPC" {
  cluster_name = aws_eks_cluster.Hogwarts.name
  addon_name   = "vpc-cni"
}

resource "aws_eks_addon" "EBS" {
  cluster_name = aws_eks_cluster.Hogwarts.name
  addon_name   = "aws-ebs-csi-driver"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "Hogwarts" {
  name               = "Hogwarts_IAM_Role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "Hogwarts-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.Hogwarts.name
}

resource "aws_iam_role_policy_attachment" "Hogwarts-AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.Hogwarts.name
}

resource "aws_iam_role_policy_attachment" "Hogwarts-AmazonEKS_VPC_CNI" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.Hogwarts.name
}

resource "aws_iam_role_policy_attachment" "Hogwarts-AmazonEKS_EBS_CSI_DRIVER" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role       = aws_iam_role.Hogwarts.name
}

resource "aws_iam_role_policy_attachment" "Hogwarts-AmazonEKS_SERVICE_POLICY" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.Hogwarts.name
}

resource "aws_iam_role_policy_attachment" "Hogwarts-AmazonEKS_WORKERNODE_POLICY" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.Hogwarts.name
}

resource "aws_iam_role_policy_attachment" "Hogwarts-AmazonEKS_SECRET_MANAGER" {
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
  role       = aws_iam_role.Hogwarts.name
}

resource "aws_iam_role_policy_attachment" "Hogwarts-AmazonEKS_EC2_FULLACCESS" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.Hogwarts.name
}

resource "aws_iam_role_policy_attachment" "Hogwarts-AmazonEKS_HEALTH_FULLACCESS" {
  policy_arn = "arn:aws:iam::aws:policy/AWSHealthFullAccess"
  role       = aws_iam_role.Hogwarts.name
}

resource "aws_iam_role_policy_attachment" "Hogwarts-AmazonEKS_FARGATE" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.Hogwarts.name
}
}
