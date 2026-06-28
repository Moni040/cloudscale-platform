provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "CloudScale"
      ManagedBy   = "Terraform"
      Environment = var.environment
    }
  }
}