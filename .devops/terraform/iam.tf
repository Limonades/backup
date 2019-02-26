resource "aws_iam_user" "skyrocket_robot" {
    name = "skyrocket_robot"
}

resource "aws_iam_access_key" "skyrocket_robot" {
    user = "${aws_iam_user.skyrocket_robot.name}"
}

resource "aws_iam_user_policy" "skyrocket_robot_admin" {
    name = "admin_access"
    user = "${aws_iam_user.skyrocket_robot.name}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Effect": "Allow",
          "Action": "*",
          "Resource": "*"
      }
  ]
}
EOF
}

#data "aws_acm_certificate" "ssl_cert" {
#  domain = "${var.application_info["main_domain"]}"
#  statuses = ["ISSUED"]
#}

output "skyrocket_robot_secret_key" {
  value = "${aws_iam_access_key.skyrocket_robot.secret}"
}

output "skyrocket_robot_access_key" {
  value = "${aws_iam_access_key.skyrocket_robot.id}"
}
