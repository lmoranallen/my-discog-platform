# Uploading static codebase to AWS S3 Bucket
resource "aws_s3_bucket" "discog_app" {
  bucket = "my-discog-app-bucket"

  tags = {
    Name    = "${var.bucket_name}"
    Version = "v0.01"
  }
}

resource "aws_s3_bucket_website_configuration" "discog_app" {
  bucket = aws_s3_bucket.discog_app.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "discog_app" {
  bucket = aws_s3_bucket.discog_app.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# resource "aws_s3_bucket_acl" "discog_app" {
#     depends_on = [ aws_s3_bucket_public_access_block.discog_app ]
#     bucket = aws_s3_bucket.discog_app.id
#     acl = "public-read"
# }


resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.discog_app.id
  policy = <<EOF
            {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.discog_app.bucket}/*"
        }
    ]
}
        EOF
}