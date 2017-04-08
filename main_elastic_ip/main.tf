resource "aws_internet_gateway" "gw" {
  vpc_id = "${var.vpc_id}"
  tags {
        Name = "Main Internet Gateway"
    }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.first_ip.id}"
  subnet_id = "${var.public_subnet_us_west_1a}"
  depends_on = [ "aws_internet_gateway.gw"]
}

resource "aws_eip" "first_ip" {
  vpc = true
  depends_on = ["aws_internet_gateway.gw"]
}

output "ip" {value = "${aws_eip.first_ip.id}"} 
output "gateway_id" {value = "${aws_internet_gateway.gw.id}"}
output "nat_gateway_id" {value = "${aws_nat_gateway.nat.id}"}
