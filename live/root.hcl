locals {
  aws_region = "us-east-1"
  project    = "cloudscale"
}

remote_state {
  backend = "s3"

  config = {
    bucket         = "cloudscale-terraform-state-monish-2026"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    encrypt        = true
    dynamodb_table = "cloudscale-terraform-locks"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"

  contents = <<EOF
provider "aws" {
  region = "${local.aws_region}"
}
EOF
}