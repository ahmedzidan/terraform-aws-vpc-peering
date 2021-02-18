output "accept_status" {
  value       = aws_vpc_peering_connection.requester_accepter.accept_status
  description = "The status of the VPC Peering Connection request"
}
