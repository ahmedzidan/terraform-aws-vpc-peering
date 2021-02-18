provider "aws" {
}

provider "aws" {
  alias  = "accepter_provider"
}

data "aws_caller_identity" "accepter" {
  provider = aws.accepter_provider
}

resource "aws_vpc_peering_connection" "requester_accepter" {
  peer_owner_id = data.aws_caller_identity.accepter.account_id
  peer_vpc_id   = var.accepter_vpc_id
  vpc_id        = var.requester_vpc_id
  peer_region   = var.accepter_region
  auto_accept   = false
  tags          = var.tags
  timeouts {
    create = "10m"
  }
}

resource "aws_vpc_peering_connection_accepter" "requester_accepter" {
  provider                  = aws.accepter_provider
  vpc_peering_connection_id = aws_vpc_peering_connection.requester_accepter.id
  auto_accept               = true
  tags                      = var.tags
}

resource "aws_vpc_peering_connection_options" "requester" {
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.requester_accepter.id
  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

resource "aws_vpc_peering_connection_options" "accepter" {
  provider = aws.accepter_provider

  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.requester_accepter.id

  accepter {
    allow_remote_vpc_dns_resolution = true
  }
}
