terraform {
  backend "s3" {
    bucket         = "terraform-statefiles-ayotunde" #replace with your bucket name
    key            = "terraform/state.tfstate"
    region         = "eu-west-2" #replace with the right region
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

resource "aws_vpc" "main" {
    cidr_block =  "10.0.0.0/16"

    tags = {
      Name = "main-vpc"
    }
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "main-igw"
    }
  
}