provider "aws" {
  region = var.region
}

module "vpc" {
  source              = "../../modules/vpc"
  cidr_block          = var.cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  public_subnet_cidr2 = var.public_subnet_cidr2
  availability_zone   = var.availability_zone
  availability_zone2  = var.availability_zone2
  env                 = var.env
  region              = var.region
}

module "ec2" {
  source        = "../../modules/ec2"
  instance_type = var.instance_type
  ami_id        = var.ami_id
  region        = var.region
  subnet_id     = module.vpc.public_subnet_id
  # key_name     = var.key_name
  env           = var.env
}


