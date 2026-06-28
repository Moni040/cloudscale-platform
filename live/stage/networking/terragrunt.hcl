include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/networking"
}

inputs = {
  aws_region         = "us-east-1"
  environment        = "stage"
  project_name       = "cloudscale"

  vpc_cidr           = "10.0.0.0/16"

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]

  public_subnets = [
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]

  private_subnets = [
    "10.0.13.0/24",
    "10.0.14.0/24"
  ]
}