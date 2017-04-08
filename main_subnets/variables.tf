variable "name" {}
variable "vpc_id" {}

variable "region" {
  default = "us-west-2"
}
variable "vpc_cidr" {
  description = "My CiDR VPC"
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "Public Subnet"
  default = "10.0.0.0/24"
}
variable "private_subnet_cidr_1" {
  description = "Private Subnet"
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr_2" {
  description = "Private subnet"
  default = "10.0.2.0/24"
}
