provider "aws" {

  region = "us-east-1"
}

terraform {
  required_version = ">= 1.0.7"
}


resource "aws_instance" "app_server" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name   = "Jenkins"

 # root disk
  root_block_device {
    volume_size           = "30"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  tags = {
    Name = "Devop"
  }
}

output "my-public-ip"{
       value=aws_instance.app_server.public_ip
}

