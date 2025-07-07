# ---- AWS Provider ----
provider "aws" {
  region     = "us-east-1"

}

# ---- Load latest Ubuntu AMI ----
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

# ---- Upload your SSH public key ----
resource "aws_key_pair" "deployer" {
  key_name   = "my-terraform-key"
  public_key = var.my_terraform_public_key
}

# ---- Security Group (SG) with SSH and HTTP allowed ----
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow SSH and HTTP"
  # vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_ip_block
  }

  ingress {
    description = "HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.http_ip_block
  }
  ingress {
    description = "HTTPS access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.https_ip_block
  }
  dynamic "egress" {
    for_each = var.output_ports
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}


# ---- EC2 Instance ----
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "learn-terraform-ec2-${local.project_name}"
  }
}
