resource "aws_instance" "web1" {
  ami           = lookup(var.AMI, var.AWS_REGION)
  instance_type = var.ec2_instance_type
  subnet_id     = aws_subnet.prod-subnet-public-1.id
  key_name      = aws_key_pair.my-key-pair.key_name
  # vpc_security_group_ids = [aws_security_group.ssh-allowed.id]
  security_groups             = [aws_security_group.ssh-allowed.id]
  associate_public_ip_address = true

  provisioner "remote-exec" {
    inline = ["echo 'wait untill SSH is ready"]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/my-key-pair")
      host        = aws_instance.web1.public_ip
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${aws_instance.web1.public_ip}, --private-key ${file("${path.module}/my-key-pair")} nginx.yaml"
  }
}

locals {
  private_key_path = file("${path.module}/my-key-pair")
}
# Nginx installation
# provisioner "file" {
#   source      = "nginx.sh"
#   destination = "/tmp/nginx.sh"
# }
# provisioner "remote-exec" {
#   inline = [
#     "chmod +x /tmp/nginx.sh",
#     "sudo /tmp/nginx.sh"
#   ]
# }

#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("${path.module}/London-region-key-pair")
#     host        = self.public_ip
#   }
