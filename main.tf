provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0551ce4d67096d606"
  instance_type = "t2.micro"
  tags = {
    Name = "DemoInstance"
  }
}

terraform {
  backend "s3" {
    bucket = "jenkins-state-01"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}
