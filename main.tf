module "network" {
  source = "git@github.com:M03HE/terraform-proj-network-Module.git"
  name                      = "proj-vpc"
  vpc_cidr_block            = "10.0.0.0/16"
  public_subnets_cidr_block = "10.0.0.0/24"
  security_access           = ["0.0.0.0/0"]
  time_instance_start       = "cron(00 16 * * ? *)"
  time_instance_stop        = "cron(00 04 * * ? *)"
  email_usr                 = "moshemhd@gmail.com"
}

# module "ansible" {

# }
