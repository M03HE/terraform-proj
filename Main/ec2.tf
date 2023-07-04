locals {
  private_key_path = "~/Downloads/devops.pem"
  key_name         = "devops"
}
resource "local_file" "ssh_key" {
  filename = "${local.key_name}.pem"
  content = local.private_key_path
  file_permission = "0400"
}
resource "aws_instance" "web1" {
  # ami                         = lookup(var.AMI, var.AWS_REGION)
  ami                         = "ami-01dd271720c1ba44f"
  subnet_id                   = aws_subnet.prod-subnet-public-1.id
  instance_type               = var.ec2_instance_type
  associate_public_ip_address = true
  # security_groups             = [aws_security_group.ssh-allowed.id]
  key_name                    = local.key_name
  # subnet_id                   = "subnet-01988185fe9c14e04"
  # instance_type               = "t2.micro"
  # ami                    = "ami-01dd271720c1ba44f"
  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]

  provisioner "remote-exec" {
    inline = ["echo 'Wait untill SSH is ready'"]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(local_file.ssh_key.content)
      host        = self.public_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.web1.public_ip}, --private-key ${local_file.ssh_key.content} nginx.yaml"
  }
}

output "nginx_ip" {
  value = aws_instance.web1.public_ip
}
