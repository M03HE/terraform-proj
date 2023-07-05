terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.5.0"
    }
  }
  backend "s3" {
    bucket = "moshedabush-devops"
    key    = "aws-bucket-demo1.tfstate"
    region = "eu-west-1"
  }
}
