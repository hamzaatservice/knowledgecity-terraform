resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine             = "mysql"
  engine_version     = "8.0"
  instance_class     = var.db_instance_class
  name               = var.db_name
  username           = var.db_username
  password           = var.db_password
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.default.id]

  tags = {
    Name = "KnowledgeCityRDS"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "knowledgecity-db-subnet-group"
  subnet_ids = [aws_subnet.private.id]

  tags = {
    Name = "KnowledgeCityDBSubnetGroup"
  }
}
