# Includes configurations for ownership controls, public access, and bucket policies.


locals {
  env = terraform.workspace
}

resource "aws_s3_bucket" "site_bucket" {
  bucket = "asael-${local.env}-workspace-portfolio"

  tags = {
    Name = "asael-${local.env}-workspace-portfolio"
    Environment = local.env
  }
}

resource "aws_s3_bucket_ownership_controls" "site_bucket" {
  bucket = aws_s3_bucket.site_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "site_bucket" {
  bucket = aws_s3_bucket.site_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}



resource "aws_s3_bucket_website_configuration" "mysite" {
  bucket = aws_s3_bucket.site_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.site_bucket.id
  key = "index.html"
  source = "index/${local.env}/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.site_bucket.id
  key = "error.html"
  source = "index/error.html"
  content_type = "text/html"
}

resource "aws_s3_bucket_policy" "site_bucket_policy" {
  bucket = aws_s3_bucket.site_bucket.id
  


  depends_on = [ 
    aws_s3_bucket_public_access_block.site_bucket
   ]

   policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Sid = "PubliicReadGetObject"
            Effect = "Allow"
            Principal = "*"
            Resource = "${aws_s3_bucket.site_bucket.arn}/*"
            Action = ["s3:GetObject"]
        }  
    ]
   })
}