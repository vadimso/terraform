
provider "aws" {
   region     = "us-east-1"
   access_key = ""
   secret_key = ""
}


resource "aws_dynamodb_table" "state_locking" {
  hash_key = "LockID"
  name     = "dynamodb-state-locking"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}

resource "aws_instance" "ec2_example" {
    ami = "ami-0c4f7023847b90238"
    instance_type = "t2.micro"
    tags = {
      Name = "EC2 Instance with remote state"
    }
}

terraform {
    backend "s3" {
        bucket = "vadims-terraform-s3-bucket"
        key    = "vadims/terraform/remote/s3/terraform.tfstate"
        region     = "us-east-1"
    }
}
