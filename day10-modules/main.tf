

# --- VPC MODULE ---
module "vpc" {
  source              = "./modules/vpc"
  cidr_block          = var.cidr_block
  subnet_cidr_block   = var.subnet_cidr_block
  subnet2_cidr_block  = var.subnet2_cidr_block
  az                  = var.az1
  az2                 = var.az2
}


# --- EC2 MODULE ---
module "ec2" {
  source        = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
}



# --- RDS MODULE ---
module "rds" {
  source         = "./modules/rds"
  subnet_ids     = [module.vpc.subnet_id, module.vpc.subnet2_id]
  instance_class = var.rds_instance_class
  db_name        = var.db_name
  db_user        = var.db_user
  db_password    = var.db_password
}

