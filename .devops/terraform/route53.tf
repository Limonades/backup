resource "aws_route53_zone" "app" {
  name = "${var.application_info["main_domain"]}"
}

resource "aws_route53_record" "naked" {
  zone_id = "${aws_route53_zone.app.zone_id}"
  name    = "${var.application_info["main_domain"]}"
  type    = "A"
  ttl     = "600"
  records = ["34.193.69.252", "34.193.204.92"]
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.app.zone_id}"
  name    = "www.${var.application_info["main_domain"]}"
  type    = "CNAME"
  ttl     = "600"
  records = ["proxy-ssl.webflow.com"]
}

resource "aws_route53_record" "mail" {
  zone_id = "${aws_route53_zone.app.zone_id}"
  name    = "${var.application_info["main_domain"]}"
  type    = "MX"
  ttl     = "3600"

  records = [
    "5 alt1.aspmx.l.google.com",
    "5 alt2.aspmx.l.google.com",
    "1 aspmx.l.google.com",
    "10 aspmx2.googlemail.com",
    "10 aspmx3.googlemail.com",
  ]
}

resource "aws_route53_record" "txt" {
  zone_id = "${aws_route53_zone.app.zone_id}"
  name    = "${var.application_info["main_domain"]}"
  type    = "TXT"
  ttl     = "3600"
  records = ["v=spf1 include:_spf.google.com ~all", "google-site-verification=43xd0eXWQTDjlThnA0I5btsGxy0mrw8K3dvifzY6d9o"]
}
