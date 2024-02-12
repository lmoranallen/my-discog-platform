variable "bucket_name" {
  default = "my-discog-app-bucket493"
}

variable "aws_region" {
  default = "eu-west-2"
  type    = string
}

variable "s3_origin_id" {
  default = "DiscogS3Origin"
}

variable "hosted_zone" {
  type    = string
  default = "discog-test"
}

