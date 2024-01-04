resource "aws_db_instance" "RDS" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "MariaDB"
  engine_version       = "10.6.14"
  instance_class       = "db.t3.micro"
  identifier           = "database-1"
  username             = "admin"
  password             = "test12345"
  parameter_group_name = "default.mariadb10.6"
  skip_final_snapshot  = true
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.security.id] 
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
}
output "rds_endpoint" {
  value = aws_db_instance.RDS.endpoint
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "rds-subnet-group"

  subnet_ids = [aws_subnet.subnet3.id , aws_subnet.subnet4.id , aws_subnet.subnet1.id , aws_subnet.subnet2.id]
}