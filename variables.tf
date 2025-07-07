variable "instance_type" {
  type        = string
  description = "this is the tyoe of the instance"
  default     = "t2.micro"
}
variable "http_ip_block" {
  type        = list(string)
  description = "http ip"
  default     = ["0.0.0.0/0"]
}
variable "https_ip_block" {
  type        = list(string)
  description = "https ips to be used "
  default     = ["0.0.0.0/0"]

}
variable "ssh_ip_block" {
  type        = list(string)
  description = "https ips to be used "
  default     = ["0.0.0.0/0"]

}
variable "output_ports" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "https ips to be used "
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
locals {
    project_name = "lakshya-project"

}

variable "my_terraform_public_key"{
  type = string
}
