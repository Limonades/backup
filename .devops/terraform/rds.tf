resource "aws_db_subnet_group" "app" {
    name = "${var.application_info["name_lower"]}"
    subnet_ids = ["${aws_subnet.subnet_1.id}", "${aws_subnet.subnet_2.id}", "${aws_subnet.subnet_3.id}", "${aws_subnet.subnet_4.id}"]
    tags {
        Name = "${var.application_info["name"]} Subnet Group"
    }
}

resource "aws_db_instance" "qa" {
  allocated_storage    = 5
  engine               = "mariadb"
  engine_version       = "10.0.24"
  instance_class       = "db.t2.micro"
  storage_type         = "gp2"
  identifier           = "${var.application_info["name_lower"]}-qa"
  name                 = "${var.application_info["name_lower"]}_qa"
  username             = "${var.application_info["name_lower"]}"
  password             = "${var.db_password["qa"]}"
  parameter_group_name = "default.mariadb10.0"
  multi_az             = false
  publicly_accessible  = true
  vpc_security_group_ids = ["${aws_security_group.db_security_group.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.app.id}"
}

resource "aws_db_instance" "staging" {
  allocated_storage    = 5
  engine               = "mariadb"
  engine_version       = "10.0.24"
  instance_class       = "db.t2.micro"
  storage_type         = "gp2"
  identifier           = "${var.application_info["name_lower"]}-staging"
  name                 = "${var.application_info["name_lower"]}_staging"
  username             = "${var.application_info["name_lower"]}"
  password             = "${var.db_password["staging"]}"
  parameter_group_name = "default.mariadb10.0"
  multi_az             = false
  publicly_accessible  = true
  vpc_security_group_ids = ["${aws_security_group.db_security_group.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.app.id}"
}

resource "aws_db_instance" "production" {
  allocated_storage    = 10
  engine               = "mariadb"
  engine_version       = "10.0.24"
  instance_class       = "db.t2.micro"
  storage_type         = "gp2"
  identifier           = "${var.application_info["name_lower"]}-production"
  name                 = "${var.application_info["name_lower"]}_production"
  username             = "${var.application_info["name_lower"]}"
  password             = "${var.db_password["production"]}"
  parameter_group_name = "default.mariadb10.0"
  multi_az             = false
  publicly_accessible  = true
  vpc_security_group_ids = ["${aws_security_group.db_security_group.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.app.id}"
}

# A security group for the RDS so it is accessible via the web
resource "aws_security_group" "db_security_group" {
  name        = "${var.application_info["name_lower"]}_db_security_group"
  vpc_id      = "${aws_vpc.app.id}"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["207.245.56.186/32",
                   "${aws_subnet.subnet_1.cidr_block}",
                   "${aws_subnet.subnet_2.cidr_block}",
                   "${aws_subnet.subnet_3.cidr_block}",
                   "${aws_subnet.subnet_4.cidr_block}"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "rds_qa_host" {
  value = "${aws_db_instance.qa.endpoint}"
}

output "rds_staging_host" {
  value = "${aws_db_instance.staging.endpoint}"
}

output "rds_production_host" {
  value = "${aws_db_instance.production.endpoint}"
}
