module "git" {
    source = "github.com/JAIDEEP-TRIP/terraform_prac/day-8"
     ami_id = "ami-0150ccaf51ab55a51"
    instance = "t3.micro"
    availability = "us-east-1a"
  
}