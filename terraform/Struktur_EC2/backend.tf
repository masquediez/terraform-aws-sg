terraform { 
  backend "s3" {
    bucket = "techstarter-gabriel-test"
    key    = "s3-example/terraform.tfstate"
    region = "eu-central-1"
  }
}