terraform {
  backend "s3" {
    bucket         = "terraform-state-300"
    key            = "terraform/state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}