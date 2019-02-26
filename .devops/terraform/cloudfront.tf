# resource "aws_cloudfront_distribution" "s3_distribution" {
#   origin {
#     domain_name = "${var.application_info["name_lower"]}-public-storage.s3.amazonaws.com"
#     origin_id   = "${var.application_info["name_lower"]}-cloudfront"
#   }

#   enabled             = true
#   is_ipv6_enabled     = true

#   aliases = ["assets.${var.application_info["main_domain"]}"]

#   default_cache_behavior {
#     allowed_methods  = ["GET", "HEAD"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "${var.application_info["name_lower"]}-cloudfront"

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

#   tags {
#     Environment = "production"
#   }

#   viewer_certificate {
#     cloudfront_default_certificate = false
#     acm_certificate_arn = "${data.aws_acm_certificate.ssl_cert.arn}"
#     ssl_support_method = "sni-only"
#     minimum_protocol_version = "TLSv1"
#   }

#   retain_on_delete = true
# }

# resource "aws_route53_record" "assets" {
#    zone_id = "${aws_route53_zone.app.zone_id}"
#    name = "assets.${var.application_info["main_domain"]}"
#    type = "CNAME"
#    ttl = "3600"
#    records = ["${aws_cloudfront_distribution.s3_distribution.domain_name}"]
# }
