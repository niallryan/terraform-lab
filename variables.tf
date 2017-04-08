variable "region" {
  default = "us-west-2"
}

variable "access_key" {
  default=""
}
variable "secret_key" {
  default=""
}
variable "vpc_cidr" {
  description = "My CiDR VPC"
  default = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "Public Subnet"
  default = "10.0.0.0/24"
}
variable "private_subnet_cidr" {
  description = "Private Subnet"
  default = "10.0.1.0/24"
}
