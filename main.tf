
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