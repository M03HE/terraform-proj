resource "aws_instance" "web1" {
  ami                    = lookup(var.AMI, var.AWS_REGION)
  instance_type          = var.ec2_instance_type
  subnet_id              = aws_subnet.prod-subnet-public-1.id
  key_name               = aws_key_pair.my-key-pair.key_name
  vpc_security_group_ids = [aws_security_group.ssh-allowed.id]

}

# Nginx installation
#   provisioner "file" {
#     source      = "nginx.sh"
#     destination = "/tmp/nginx.sh"
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "chmod +x /tmp/nginx.sh",
#       "sudo /tmp/nginx.sh"
#     ]
#   }

#   connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file("${path.module}/London-region-key-pair")
#     host        = self.public_ip
#   }
