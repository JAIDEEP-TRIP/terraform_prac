resource "aws_instance" "name" {
    ami           = "ami-08a6efd148b1f7504"
    instance_type = "t3.micro"
    tags = {
        Name = "CreatedByJenkins"
        
    }

resource "aws_instance" "gitactions" {
    ami           = "ami-08a6efd148b1f7504"
    instance_type = "t3.micro"
    tags = {
        Name = "Createdbygithub"
        
    }

  
}
