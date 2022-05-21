resource "null_resource" "remote"{
connection {
       type = "ssh"
       user = "ubuntu"
       private_key = file("/Users/vinoth.subbiah/projects/Terraform/devops-terraform-aws-instance/Jenkins.pem")
       host  = aws_instance.app_server.public_ip
}

# provisioner "remote-exec" {
#          inline = [
#                        "sudo yum install httpd -y",
#                        "sudo yum install git -y",
#                        "sudo systemctl enable httpd",
#                        "sudo git clone https://github.com/florient2016/myweb.git /var/www/html/web/",
#                        "sudo systemctl start httpd"
#                   ]
#   }
# }

 provisioner "remote-exec" {
          inline = [
                       "wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -",
                       "sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'",
		       "sudo apt update",
		       "sudo apt install openjdk-8-jre -y",
                       "sudo apt-get install jenkins -y",
                       "sudo systemctl start jenkins",
                       "sudo apt install git -y"
                     ]
   }
}
