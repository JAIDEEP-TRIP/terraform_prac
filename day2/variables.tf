variable "ami_id" {
  
}

variable "instance_type"{
    description = "Type of instance to create"
    default     = "t2.nano"    # Default value can be overridden in terraform.tfvars
    
}