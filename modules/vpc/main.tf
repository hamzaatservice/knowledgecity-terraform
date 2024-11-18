resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "KnowledgeCityVPC"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "saudi-arabia-1a"

  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "saudi-arabia-1a"

  tags = {
    Name = "PrivateSubnet"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "default_security_group_id" {
  value = aws_security_group.default.id
}
