variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "ec2_instance_type" {
  description = "The type of the instance"
  type        = string
  default     = "t2.micro"
}

variable "AMI" {
  type = map(string)
  default = {
    eu-west-1 = "ami-05432c5a0f7b1bfd0"
  }
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

