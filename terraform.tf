terraform {
  #----for the use by the TERRAFORM CLOUD--------#
  # cloud {

  #   organization = "aspire_lakshya"

  #   workspaces {
  #     name = "terraform-learning-space"
  #   }
  # }
  #-----provider------
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  required_version = ">=1.2"
}
