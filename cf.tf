# resource "aws_cloudfront_origin_access_control" "s3_origin_access" {
#   name                              = "${var.bucket_name} OAC"
#   description                       = "Cloudfront origin access control settings"
#   origin_access_control_origin_type = "s3"
#   signing_behavior                  = "always"
#   signing_protocol                  = "sigv4"
# }


# resource "aws_cloudfront_distribution" "s3_distribution" {
#   origin {
#     domain_name              = aws_s3_bucket.discog_app.    
#     origin_access_control_id = aws_cloudfront_origin_access_control.s3_origin_access.id
#     origin_id                = var.s3_origin_id
#   }

#   enabled             = true
#   is_ipv6_enabled     = true
#   comment             = "Test Cloudfront Distribution setup for Discog Take-Home"
#   default_root_object = "index.html"

#   default_cache_behavior {
#     allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = var.s3_origin_id

#     forwarded_values {
#       query_string = false

#       cookies {
#         forward = "none"
#       }
#     }

#     viewer_protocol_policy = "allow-all"
#     min_ttl                = 0
#     default_ttl            = 3600
#     max_ttl                = 86400
#   }

#   price_class = "PriceClass_100"

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }
#   }

#   tags = {
#     Environment = "production"
#   }

#   viewer_certificate {
#     cloudfront_default_certificate = true
#   }
# }