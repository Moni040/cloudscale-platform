include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/networking"
}

inputs = {
  aws_region         = "us-east-1"
  environment        = "prod"
  project_name       = "cloudscale"

  vpc_cidr           = "10.0.0.0/16"

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]

  public_subnets = [
    "10.0.5.0/24",
    "10.0.6.0/24"
  ]

  private_subnets = [
    "10.0.15.0/24",
    "10.0.16.0/24"
  ]
}