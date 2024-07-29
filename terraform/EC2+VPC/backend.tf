terraform {
  backend "s3" {
    bucket = "demogabriel1"
    key    = "s3-example/terraform.tfstate"
    region = "eu-central-1"
  }
}