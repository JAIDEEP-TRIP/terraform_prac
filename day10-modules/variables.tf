variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = ""
}

variable "subnet_cidr_block" {
  description = "CIDR block for the first subnet"
  type        = string
  default     = ""
}

variable "subnet2_cidr_block" {
  description = "CIDR block for the second subnet"
  type        = string
  default     = ""
}

variable "az1" {
  description = "Availability Zone 1"
  type        = string
  default     = ""
}

variable "az2" {
  description = "Availability Zone 2"
  type        = string
  default     = ""
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "rds_instance_class" {
  description = "Instance type for RDS"
  type        = string
}

variable "db_name" {
  description = "Name of the database to create"
  type        = string
}

variable "db_user" {
  description = "Username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
}

