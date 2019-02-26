# resource "aws_instance" "app_production" {
#     instance_type = "t2.micro"
#     ami = "ami-f4cc1de2"
#     subnet_id = "${aws_subnet.subnet_1.id}"

#     key_name = "${var.application_info["key_pair"]}"
#     vpc_security_group_ids = [ "${aws_security_group.ec2_security_group.id}" ]
#     associate_public_ip_address = true

#     tags {
#         Name = "${var.application_info["name_lower"]}-production"
#     }
# }

