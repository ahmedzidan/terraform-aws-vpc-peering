## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| aws.accepter\_provider | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| accepter\_region | region for the vpc that you want to peer with it | `string` | n/a | yes |
| accepter\_vpc\_id | vpc id that you want to peer with it | `string` | n/a | yes |
| requester\_vpc\_id | your current vpc | `string` | n/a | yes |
| tags | tags for your vpc peering | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| accept\_status | The status of the VPC Peering Connection request |

## Example. 
```aidl
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
```