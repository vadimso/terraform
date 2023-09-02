# this tf file will create s3 bucket with folder 

provider "aws" {
  region = "us-east-2" # Replace with your desired AWS region
}
resource "aws_s3_bucket" "labs-devops" {
  bucket = "vadimso-devops-stuff" # Replace with your desired bucket name
  #aws_s3_bucket_acl    = "public-read-write"            # Access control list for the bucket (can be "private", "public-read", "public-read-write", etc.)
}

resource "aws_s3_bucket_object" "python-scripts-folder" {
  bucket = aws_s3_bucket.labs-devops.id
  key    = "python-scripts/" # Note the trailing slash to create a "folder"
  source = "/dev/null"  # You can use any content or file as the source
  etag   = "d41d8cd98f00b204e9800998ecf8427e" # MD5 checksum for an empty file
}
