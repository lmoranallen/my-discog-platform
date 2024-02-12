output "bucket_name" {
  description = "Name of S3 bucket"
  value       = var.bucket_name
}

output "website_url" {
  value = "http://my-discog-app-bucket493.s3-website.${var.aws_region}.amazonaws.com"
}