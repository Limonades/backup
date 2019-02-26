# Important! If you have cloned this repository there are two missing
# files which are required to successfully Terraform this project.
#
# // auth-for-container-registry
# {
#    "registry.gitlab.com": {
#        "auth": "exampleblahblah",
#        "email": "dev@skyrocket.is"
#    }
# }
#
# // secrets.tf
# variable "db_password" {
#   type = "map"
#   default = {
#     production = "something1",
#     staging = "something2"
#   }
# }
# variable "aws_access" {
#   type = "map"
#   default = {
#     access_key = "somethingkey"
#     secret_key = "somethingsecretkey"
#   }
# }

variable "application_info" {
  type = "map"

  default = {
    name        = "cdax-craft"
    name_lower  = "cdax"
    key_pair    = "cdax-craft"
    main_domain = "alternahaircare.com"
  }
}
