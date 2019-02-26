resource "aws_route53_record" "qa" {
  zone_id = "${aws_route53_zone.app.zone_id}"
  name    = "qa.${var.application_info["main_domain"]}"
  type    = "A"

  alias {
    name                   = "${aws_elastic_beanstalk_environment.qa.cname}"
    zone_id                = "Z117KPS5GTRQ2G"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "staging" {
  zone_id = "${aws_route53_zone.app.zone_id}"
  name    = "staging.${var.application_info["main_domain"]}"
  type    = "A"

  alias {
    name                   = "${aws_elastic_beanstalk_environment.staging.cname}"
    zone_id                = "Z117KPS5GTRQ2G"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "production" {
  zone_id = "${aws_route53_zone.app.zone_id}"
  name    = "production.${var.application_info["main_domain"]}"
  type    = "A"

  alias {
    name                   = "${aws_elastic_beanstalk_environment.production.cname}"
    zone_id                = "Z117KPS5GTRQ2G"
    evaluate_target_health = false
  }
}
