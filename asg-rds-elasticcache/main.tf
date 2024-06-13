provider "aws" {
  region = "your-region"
}

resource "aws_autoscaling_group" "example" {
  name             = "example-asg"
  # ASG configuration parameters
}

resource "aws_security_group" "example-asg-sg" {
  name        = "example-asg-sg"
  description = "Security group for ASG instances"
  vpc_id      = "your-vpc-id"
  # additional security group rules as needed
}

resource "aws_security_group" "example-rds-sg" {
  name        = "example-rds-sg"
  description = "Security group for RDS"
  vpc_id      = "your-vpc-id"
  # additional security group rules as needed
}

resource "aws_security_group" "example-elasticache-sg" {
  name        = "example-elasticache-sg"
  description = "Security group for ElastiCache"
  vpc_id      = "your-vpc-id"
  # additional security group rules as needed
}

resource "aws_security_group_rule" "asg-to-rds" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.example-asg-sg.id
  security_group_id        = aws_security_group.example-rds-sg.id
}

resource "aws_security_group_rule" "asg-to-elasticache" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.example-asg-sg.id
  security_group_id        = aws_security_group.example-elasticache-sg.id
}
