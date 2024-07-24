provider "aws" {
  profile = "680011609969_Student"
  region  = "eu-central-1"
}

# Crear una instancia EC2
resource "aws_instance" "erste_instanz" {
  instance_type          = "t2.nano"
  ami                    = "ami-01e444924a2233b07"
  subnet_id              = "subnet-05d631793d5e56c2c"  # Debes obtener el ID de la subred válida
  vpc_security_group_ids = ["sg-0365bdde09969c499"]  # Reemplaza "sg-xxxxxxxx" con el ID del nuevo grupo de seguridad

  tags = {
    Name = "erste_instanz"
  }
}
