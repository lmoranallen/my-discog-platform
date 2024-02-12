provider "aws" {
  region                   = "eu-west-2"
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}

# terraform {
#   backend "s3" {
#     bucket = "my-discog-app-bucket493"
#     key    = "Discog App State"
#     region = "eu-west-2"
#   }
# }
