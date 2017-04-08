resource "aws_subnet" "public_subnet_us_west_1a" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = true
  tags = {
  	Name =  "Public Subnet"
  }
}

resource "aws_subnet" "private_1_subnet_us_west_1a" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.private_subnet_cidr_1}"
  tags = {
  	Name =  "Subnet private 1 az 1a"
  }
}
 
resource "aws_subnet" "private_2_subnet_us_west_1b" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.private_subnet_cidr_2}"
  tags = {
  	Name =  "Subnet private 2 az 1b"
  }
}

output "public_subnet_us_west_1a" {value = "${aws_subnet.public_subnet_us_west_1a.id}"}
output "private_1_subnet_us_west_1a" {value ="${aws_subnet.private_1_subnet_us_west_1a.id}"}
output "private_2_subnet_us_west_1b" {value ="${aws_subnet.private_2_subnet_us_west_1b.id}"}
