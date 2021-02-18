variable "accepter_vpc_id" {
  description = "vpc id that you want to peer with it"
  type        = string
  default     = "test-vpc"
}
variable "vpc_id" {
  description = "my current vpc"
  type        = string
  default     = "vpc-64test"
}

variable "region" {
  description = "region for my vpc"
  type        = string
  default     = "ap-southeast-2"
}
