# data "aws_iam_policy_document" "s3_policy" {
#     statement {
#         sid = "PublicReadGetObject"
#         principals {
#             type = "AWS"
#             identifiers = ["*"]
#         }

#         actions = [
#         "s3:GetObject",
#         ]

#         resources = [
#         "${aws_s3_bucket.discog_app.arn}/*",
#         "${aws_s3_bucket.discog_app.arn}"
#         ]
#     }
#     statement {
#       sid = "AccessS3Console"
#       principals {
#             type = "AWS"
#             identifiers = ["*"]
#         }
#       actions = [
#         "s3:ListAllMyBuckets"
#       ]

#       effect = "Allow"
#       resources = ["${aws_s3_bucket.discog_app.arn}"]
#     }
# }


# data "aws_iam_policy_document" "s3_policy" {
#     statement {
#         sid = "AllowCloudFrontServicePrincipalReadWrite"
#         effect = "Allow"
#         principals {
#             type = "Service"
#             identifiers = ["cloudfront.amazonaws.com"]
#         }

#         actions = [
#         "s3:GetObject",
#         "s3:PutObject"
#         ]

#         resources = [
#         "${aws_s3_bucket.discog_app.arn}/*"
#         ]
#         condition {
#           test = "StringEquals"
#           variable = "aws:SourceArn"
#           values = ["arn:aws:cloudfront::819736720993:distribution/${aws_cloudfront_distribution.s3_distribution.id}"]
#         }
#     }
# }