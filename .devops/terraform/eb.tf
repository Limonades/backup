resource "aws_elastic_beanstalk_environment" "production" {
  name = "${var.application_info["name_lower"]}-production"
  application = "${aws_elastic_beanstalk_application.app.name}"
  template_name = "${aws_elastic_beanstalk_configuration_template.single_docker_template.name}"
  tier = "WebServer"
  cname_prefix = "${var.application_info["name_lower"]}-production"

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_HOST"
    value     = "${aws_db_instance.production.endpoint}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_PASSWORD"
    value     = "${var.db_password["production"]}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_USER"
    value     = "${var.application_info["name_lower"]}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_DATABASE"
    value     = "${var.application_info["name_lower"]}_production"
  }
}

resource "aws_elastic_beanstalk_environment" "staging" {
  name = "${var.application_info["name_lower"]}-staging"
  application = "${aws_elastic_beanstalk_application.app.name}"
  template_name = "${aws_elastic_beanstalk_configuration_template.single_docker_template.name}"
  tier = "WebServer"
  cname_prefix = "${var.application_info["name_lower"]}-staging"

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_HOST"
    value     = "${aws_db_instance.staging.endpoint}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_PASSWORD"
    value     = "${var.db_password["staging"]}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_USER"
    value     = "${var.application_info["name_lower"]}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_DATABASE"
    value     = "${var.application_info["name_lower"]}_staging"
  }
}

resource "aws_elastic_beanstalk_environment" "qa" {
  name = "${var.application_info["name_lower"]}-qa"
  application = "${aws_elastic_beanstalk_application.app.name}"
  template_name = "${aws_elastic_beanstalk_configuration_template.single_docker_template.name}"
  tier = "WebServer"
  cname_prefix = "${var.application_info["name_lower"]}-qa"

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_HOST"
    value     = "${aws_db_instance.qa.endpoint}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_PASSWORD"
    value     = "${var.db_password["qa"]}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_USER"
    value     = "${var.application_info["name_lower"]}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_DATABASE"
    value     = "${var.application_info["name_lower"]}_qa"
  }
}
