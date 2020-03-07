# spin up one ubuntu ec2 instance

provider "aws" {
  region     = "eu-west-1"
  access_key = "access-key"
  secret_key = "secret-key"
}

resource "aws_instance" "example" {
  ami = "ami-07042e91d04b1c30d"
  instance_type = "t2.micro"
  tags {
      Name          = "server-one"
      Environment   = "test"
  }
}
