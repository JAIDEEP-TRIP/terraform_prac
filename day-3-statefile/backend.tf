terraform {
  backend "s3" {
    bucket         = "terraform-backuobhfdsbafhisfiv"
    key            = "day-1/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
