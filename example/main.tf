provider "aws" {
  region = var.region
  # profile = "requester"
  # shared_credentials_file = "~/.aws/credentials"
}

provider "aws" {
  alias      = "accepter"
  region     = var.region
  # profile = "accepter"
  # shared_credentials_file = "~/.aws/credentials"
}

terraform {
  backend "s3" {
    bucket               = "htt-terraform-infrastructure"
    key                  = "vpc-peering2/terraform.tfstate"
    workspace_key_prefix = "vpc-peering2"
    region               = "ap-southeast-2"
    # profile = "requester"
    # shared_credentials_file = "~/.aws/credentials"
  }
}

module "vpc_peering" {
  source           = "../"
  accepter_region  = var.region
  accepter_vpc_id  = var.accepter_vpc_id
  requester_vpc_id = var.vpc_id
  tags = {
    Name = "vpc-peering-between-dev-production"
  }
  providers = {
    aws = aws
    aws.accepter_provider = aws.accepter
  }
}
