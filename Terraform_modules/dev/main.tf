provider "aws" {
  region = "ap-south-1"
}

module "my_ec2" {
  source = "../modules/ec2"
  ec2_count = 1
  ami_id = "ami-0851b76e8b1bce90b"
  instance_type = "t2.micro"
  tags = "hello"
}