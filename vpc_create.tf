# # -----Ec2 Instance on public subnet
# resource "aws_instance" "app_server" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type

#   key_name                    = aws_key_pair.deployer.key_name
#   vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
#   subnet_id                   = module.vpc.public_subnets[0]
#   private_ip                  = "10.0.101.23"
#   associate_public_ip_address = true
#   tags = {
#     Name = "public-instance-on-the-vpc"
#   }

# }
# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "terraform-vpc"
#   cidr = "10.0.0.0/16"

#   azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = true
#   enable_vpn_gateway = true

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }
