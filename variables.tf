variable "region" {
  default = "us-west-2"
}

variable "access_key" {
  default=""
}
variable "secret_key" {
  default=""
}

variable "ip_range" {
  default = "192.168.0.0/16"
}
variable "availability_zones" {
  default = "us-west-2a,us-west-2b,us-west-2c"
}
variable "key_name" {
  default = "pop"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "asg_min" {
  default = "2"
}
variable "asg_max" {
  default = "5"
}
variable "asg_desired" {
  default = "1"
}

variable "amis" {
  default = {
    us-east-1 = "ami-01146c31"
    us-west-2 = "ami-01146c31"
  }
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
