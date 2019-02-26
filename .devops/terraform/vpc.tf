resource "aws_vpc" "app" {
    cidr_block = "172.32.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"

    tags {
        Name = "${var.application_info["name"]} Application"
    }
}

# ################## #
#      Subnets       #
# ################## #
resource "aws_subnet" "subnet_1" {
    vpc_id = "${aws_vpc.app.id}"
    cidr_block = "172.32.0.0/20"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = "true"

    tags {
        Name = "${var.application_info["name"]} Application Public 1"
    }
}

resource "aws_subnet" "subnet_2" {
    vpc_id = "${aws_vpc.app.id}"
    cidr_block = "172.32.16.0/20"
    availability_zone = "us-east-1c"
    map_public_ip_on_launch = "true"

    tags {
        Name = "${var.application_info["name"]} Application Public 2"
    }
}

resource "aws_subnet" "subnet_3" {
    vpc_id = "${aws_vpc.app.id}"
    cidr_block = "172.32.32.0/20"
    availability_zone = "us-east-1d"
    map_public_ip_on_launch = "true"

    tags {
        Name = "${var.application_info["name"]} Application Public 3"
    }
}

resource "aws_subnet" "subnet_4" {
    vpc_id = "${aws_vpc.app.id}"
    cidr_block = "172.32.64.0/20"
    availability_zone = "us-east-1e"
    map_public_ip_on_launch = "true"

    tags {
        Name = "${var.application_info["name"]} Application Public 4"
    }
}

# ################## #
#  Internet Gateway  #
# ################## #
resource "aws_internet_gateway" "app" {
    vpc_id = "${aws_vpc.app.id}"

    tags {
        Name = "${var.application_info["name"]} Application"
    }
}

resource "aws_route" "public" {
    route_table_id = "${aws_vpc.app.main_route_table_id}"
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.app.id}"
}
