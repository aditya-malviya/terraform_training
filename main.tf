
resource "aws_vpc" "my_tf_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_tf_vpc"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.my_tf_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "my_subnet"
  }
}


resource "aws_instance" "my_ec2_example" {
 ami = "ami-0851b76e8b1bce90b"
 instance_type = "t2.micro"
 tags = {
   Name = "tf_ec2"
 }
}

output "my_console_output" {
  value = aws_instance.my_ec2_example.availability_zone
} 


resource "aws_instance" "my_ec2_example" {
 ami = "ami-0851b76e8b1bce90b"
 instance_type = "t2.micro"
 tags = {
    Name = "${local.staging_env} - Terraform EC2"
 }
}


locals {
  staging_env = "staging"
}


resource "aws_instance" "my_ec2_example" {
 count = 3
 ami = "ami-0851b76e8b1bce90b"
 instance_type = "t2.micro"
 tags = {
    Name = "Terraform EC2-${count.index}"
 }
}


resource "aws_instance" "my_ec2_example" {
 ami = "ami-0851b76e8b1bce90b"
 instance_type = "t2.micro"
 key_name = "aditya"
 security_groups = [ "terraform-sb" ]

 tags = {
    Name = "Terraform-ec2"
 }

connection {
  type = "ssh"
  host = self.public_ip
  user = "ubuntu"
  private_key = file("C:/Users/91956/Downloads/aditya.pem")
}

provisioner "file" {
  content = "hello welcome to class"
  destination = "/home/ubuntu/welcome.txt"
 }

provisioner "remote-exec" {
  inline = [
    "sudo mkdir /home/ubuntu/test"
  ]
}
}