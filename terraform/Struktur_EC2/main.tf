
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "techstarter-gabriel-test"
  
  tags = {
    Name = "TerraformStateBucket"
  }
}

resource "aws_instance" "my_instance" {
  ami                         = "ami-01e444924a2233b07"
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  security_groups             = [aws_security_group.ssh_sg1.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "MyInstance"
  }
}

#ECS
resource "aws_ecs_cluster" "my_ecs_cluster" {
  name = "my-ecs-cluster"
}

# DynamoDB
resource "aws_dynamodb_table" "example_table" {
  name           = "gabriel-table"
  billing_mode   = "PAY_PER_REQUEST"  

  # Definición de atributos
  attribute {
    name = "id"
    type = "B" 
  }

  # Clave primaria
  hash_key = "id"

  tags = {
    Name = "bagriel-table"
  }
}
