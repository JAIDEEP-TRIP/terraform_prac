
resource "aws_s3_bucket" "example" {
  bucket = "lambdacallingbucket"
  

  tags = {
    Name        = "My bucket"

  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_object" "object" {
  bucket = "lambdacallingbucket"
  key    = "lambda_function/lambda_function.zip"  # S3 path in bucket
  source = "C:/Users/jaide/OneDrive/Desktop/Cloud and devops/Devops/Terraform/Practice/terraform_prac/day-7lambda/lambda_function.zip"
  etag   = filemd5("C:/Users/jaide/OneDrive/Desktop/Cloud and devops/Devops/Terraform/Practice/terraform_prac/day-7lambda/lambda_function.zip")
}


