resource "aws_cloudfront_distribution" "default" {
  origin {
    domain_name = var.origin_domain_name
    origin_id   = "S3-Origin"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true

  default_cache_behavior {
    target_origin_id       = "S3-Origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
    }
  }

  tags = {
    Name = "KnowledgeCityCloudFront"
  }
}
