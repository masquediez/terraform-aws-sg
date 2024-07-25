provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "sg_test_aufgabe" {
  # keine verpflichtende Argumente bei Security-Groups
}

resource "aws_security_group_rule" "ingress_ssh" {
  from_port = 22
  to_port = 22
  security_group_id = aws_security_group.sg_test_aufgabe.id
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "http" {
  from_port = 80
  to_port = 80
  security_group_id = aws_security_group.sg_test_aufgabe.id
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https" {
  from_port = 443
  to_port = 443
  security_group_id = aws_security_group.sg_test_aufgabe.id
  protocol = "tcp"
  type = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "aufgabe_vpc"
  }
}

resource "aws_instance" "Aufgabe" {
  instance_type          = "t2.nano"
  ami                    = "ami-01e444924a2233b07"
  vpc_security_group_ids = [ aws_security_group.sg_test_aufgabe.id ] 

  tags = {
    Name = "Aufgabe"
  }
  
}
