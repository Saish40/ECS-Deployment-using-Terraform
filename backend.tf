terraform {
  backend "s3" {
    bucket = "ecsbucket40"
    region = "us-east-1"
    key    = "ecs/terraform.tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.60.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}