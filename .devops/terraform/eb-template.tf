resource "aws_elastic_beanstalk_application" "app" {
  name = "${var.application_info["name"]}"
}

resource "aws_elastic_beanstalk_configuration_template" "single_docker_template" {
  name                = "${var.application_info["name_lower"]}-single-docker-template"
  application         = "${aws_elastic_beanstalk_application.app.name}"
  solution_stack_name = "64bit Amazon Linux 2017.09 v2.8.4 running Docker 17.09.1-ce"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = "${var.application_info["key_pair"]}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "${aws_iam_instance_profile.elasticbeanstalk_instance_profile.arn}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = "${aws_security_group.elasticbeanstalk_instance_security_group.id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "${aws_vpc.app.id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "${aws_subnet.subnet_1.id},${aws_subnet.subnet_2.id},${aws_subnet.subnet_3.id},${aws_subnet.subnet_4.id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "${aws_subnet.subnet_1.id},${aws_subnet.subnet_2.id},${aws_subnet.subnet_3.id},${aws_subnet.subnet_4.id}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "true"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = "Rolling"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = "50"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "classic"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "${aws_iam_role.elasticbeanstalk_service_role.name}"
  }

  setting {
    namespace = "aws:elbv2:loadbalancer"
    name      = "SecurityGroups"
    value     = "${aws_security_group.elasticbeanstalk_loadbalancer_security_group.id}"
  }

  setting {
    namespace = "aws:elbv2:loadbalancer"
    name      = "ManagedSecurityGroup"
    value     = "${aws_security_group.elasticbeanstalk_loadbalancer_security_group.id}"
  }

  setting {
    namespace = "aws:elbv2:listener:80"
    name      = "DefaultProcess"
    value     = "http"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:http"
    name      = "StickinessEnabled"
    value     = "true"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:http"
    name      = "Protocol"
    value     = "HTTP"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:http"
    name      = "Port"
    value     = "80"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:http"
    name      = "MatcherHTTPCode"
    value     = "200,301,302"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = "200,301,302"
  }

  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "DefaultProcess"
    value     = "http"
  }

  ## use following when you ready to use https

  # setting {
  #   namespace = "aws:elbv2:listener:443"
  #   name      = "SSLCertificateArns"
  #   value     = "${data.aws_acm_certificate.ssl_cert.arn}"
  # }
  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "Protocol"
    value     = "HTTPS"
  }
}
