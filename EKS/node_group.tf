#managedNodeGroups:
 # - name: Public-Worker
  #  instanceType: t3.medium
   # desiredCapacity: 2
    #minSize: 2
    #maxSize: 4
    #volumeSize: 20
    #ssh:
    #  publicKeyName: EKSKEY
    #iam:
    #  withAddonPolicies:
    #      imageBuilder: true
    #      autoscaler: true
    #      cloudWatch: true
    #      ebs: true
    #      awsLoadBalancerController: true
    #      appMesh: true
    #      appMeshPreview: true
    #      externalDNS: true
    #      certManager: true


resource "aws_eks_node_group" "hogwarts" {
  cluster_name = aws_eks_cluster.Hogwarts.name
  node_group_name = var.node_group_name
  node_role_arn = "aws_iam_role.hogwarts_role"
  subnet_ids = var.subnet_ids 

  scaling_config {
    desired_size = 2
    min_size = 2
    max_size = 4
  }

  update_config {
    max_unavailable = 1
  }
 
 disk_size = 20
 
 remote_access {
    ec2_ssh_key = "EKS"
  }

  depends_on = [
    aws_iam_role_policy_attachment.hogwarts_image_Builder, aws_iam_role_policy_attachment.hogwarts_auto_scaler,
    aws_iam_role_policy_attachment.hogwarts_cloudwatch, aws_iam_role_policy_attachment.hogwarts_ebs, 
    aws_iam_role_policy_attachment.hogwarts_lodbalancer, aws_iam_role_policy_attachment.hogwarts_app_mesh, 
    aws_iam_role_policy_attachment.hogwarts_external_dns, aws_iam_role_policy_attachment.hogwarts_cert_manager 
  ]
}

data "aws_iam_policy_document" "assume_role_1" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}


resource "aws_iam_role" "hogwarts_role_1" {
    name = "hogwarts_role_1"
    assume_role_policy = data.aws_iam_policy_document.assume_role_1.json
}

resource "aws_iam_role_policy_attachment" "hogwarts_auto_scaler" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2SpotFleetAutoscaleRole"
  role = aws_iam_role.hogwarts_role_1.name
}

resource "aws_iam_role_policy_attachment" "hogwarts_cloudwatch" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role = aws_iam_role.hogwarts_role_1.name
}

resource "aws_iam_role_policy_attachment" "hogwarts_ebs" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  role = aws_iam_role.hogwarts_role_1.name
}

resource "aws_iam_role_policy_attachment" "hogwarts_lodbalancer" {
  policy_arn = "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"
  role = aws_iam_role.hogwarts_role_1.name
}

resource "aws_iam_role_policy_attachment" "hogwarts_app_mesh" {
  policy_arn = "arn:aws:iam::aws:policy/AWSAppMeshFullAccess"
  role = aws_iam_role.hogwarts_role_1.name
}

resource "aws_iam_role_policy_attachment" "hogwarts_cert_manager" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
  role = aws_iam_role.hogwarts_role_1.name
}

resource "aws_iam_role_policy_attachment" "hogwarts_external_dns" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCertificateManagerFullAccess"
  role = aws_iam_role.hogwarts_role_1.name
}
