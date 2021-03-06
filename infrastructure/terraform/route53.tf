resource "aws_route53_record" "apex" {
  zone_id = "${data.aws_route53_zone.origin.zone_id}"

  name    = "${var.domain}"
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.origin.domain_name}"
    zone_id                = "${aws_cloudfront_distribution.origin.hosted_zone_id}"
    evaluate_target_health = false
  }
}
