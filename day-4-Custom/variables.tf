variable "cidr_blockid" {
    description = "CIDR block for the VPC"
    type        = string
    default   = " "
  
}

variable "subnet-cidr" {
    description = "CIDR block for the subnet"
    type        = string
    default     = " "
  
}

variable "ami_id" {
    description = "AMI ID for the instance"
    type        = string
    default     = " "  # Replace with a valid AMI ID
  
}