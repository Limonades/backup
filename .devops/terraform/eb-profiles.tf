resource "aws_iam_instance_profile" "elasticbeanstalk_instance_profile" {
    name = "elasticbeanstalk_instance_profile"
    role = "${aws_iam_role.elasticbeanstalk_instance_role.name}"
}


resource "aws_iam_role" "elasticbeanstalk_instance_role" {
    name = "elasticbeanstalk_instance_role"
    assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "elasticbeanstalk_webtier_attachment" {
    role = "${aws_iam_role.elasticbeanstalk_instance_role.name}"
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_role_policy_attachment" "elasticbeanstalk_webtier_multicontainerdocker" {
    role = "${aws_iam_role.elasticbeanstalk_instance_role.name}"
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker"
}

resource "aws_iam_role_policy_attachment" "elasticbeanstalk_webtier_workertier" {
    role = "${aws_iam_role.elasticbeanstalk_instance_role.name}"
    policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
}

resource "aws_iam_role_policy_attachment" "instance_s3_readonlyaccess" {
    role = "${aws_iam_role.elasticbeanstalk_instance_role.name}"
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_role" "elasticbeanstalk_service_role" {
    name = "elasticbeanstalk_service_role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "elasticbeanstalk.amazonaws.com"
      },
      "Action": "sts:AssumeRole",
      "Condition": {
        "StringEquals": {
          "sts:ExternalId": "elasticbeanstalk"
        }
      }
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "elasticbeanstalk_enchancedhealth" {
    role = "${aws_iam_role.elasticbeanstalk_service_role.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth"
}

resource "aws_iam_role_policy_attachment" "elasticbeanstalk_elasticbeanstalkservice" {
    role = "${aws_iam_role.elasticbeanstalk_service_role.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkService"
}

resource "aws_iam_role_policy_attachment" "service_s3_readonlyaccess" {
    role = "${aws_iam_role.elasticbeanstalk_service_role.name}"
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
