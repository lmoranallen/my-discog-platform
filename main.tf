provider "aws" {
    region = "eu-west-2"
}

data "archive_file" "my_discog_platform" {
    type = "zip"

    source_dir = "${path.module}/src"
    output_path = "${path.module}/src.zip"
}




# Uploading static codebase to AWS S3 Bucket


resource "aws_s3_bucket" "discog_app" {
    bucket = "my-discog-app-bucket"
}


resource "aws_s3_object" my_discog_platform {

    bucket = aws_s3_bucket.discog_app.id
    key    = "my-discog-platform.zip"
    source = data.archive_file.my_discog_platform.output_path

    tags = {
        name = "StaticWebsiteBucketInstance"
    }

    etag = filemd5(data.archive_file.my_discog_platform.output_path)
}
