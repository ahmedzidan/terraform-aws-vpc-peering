variable "accepter_vpc_id" {
  description = "vpc id that you want to peer with it"
  type        = string
}
variable "requester_vpc_id" {
  description = "your current vpc"
  type        = string
}
variable "accepter_region" {
  description = "region for the vpc that you want to peer with it"
  type        = string
}
variable "tags" {
  description = "tags for your vpc peering"
  type        = map(any)
}
