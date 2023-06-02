module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "Practice-alb"

  load_balancer_type = "application"

  vpc_id             = module.vpc.vpc_id
  subnets            = [var.public_subnet_id_1, var.private_subnet_id_2]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target = {
          target_id = var.Practice_Public_Instance_ID
          port = 80
        }
        my_other_target = {
          target_id = var.Practice_Private_Instance_ID
          port = 80
        }
      }
    }
  ]
}
