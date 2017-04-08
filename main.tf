provider "aws" {
  region = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

module "main_vpc" {
  source = "./main_vpc"
  vpc_cidr = "${var.vpc_cidr}"
  name = "vpc"
}

module "main_subnets" {
  source = "./main_subnets"
  vpc_id = "${module.main_vpc.id}"
  name = "subnets"
}

module "main_api_gateway" {
  source = "./main_api_gateway"
  vpc_id = "${module.main_vpc.id}"
  name = "api_gateway"
  main_route_table_id = "${module.main_vpc.main_route_table_id}"
  public_subnet_us_west_1a = "${module.main_subnets.public_subnet_us_west_1a}"
  private_1_subnet_us_west_1a = "${module.main_subnets.private_1_subnet_us_west_1a}"
  private_2_subnet_us_west_1b = "${module.main_subnets.private_2_subnet_us_west_1b}"
  gateway_id = "${module.main_elastic_ip.gateway_id}"
  nat_gateway_id = "${module.main_elastic_ip.nat_gateway_id}"
}

module "main_elastic_ip" {
  source = "./main_elastic_ip"
  vpc_id = "${module.main_vpc.id}"
  name = "elastic_ip"
  public_subnet_us_west_1a = "${module.main_subnets.public_subnet_us_west_1a}"
}
