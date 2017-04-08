resource "aws_route_table" "private_route_table" {
    vpc_id = "${var.vpc_id}"

    tags {
        Name = "Private route table"
    }
}

resource "aws_route" "private_route" {
    route_table_id  = "${aws_route_table.private_route_table.id}"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${var.nat_gateway_id}"
}


resource "aws_route" "main_internet_access" {
  route_table_id = "${var.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${var.gateway_id}"
}


resource "aws_route_table_association" "public_subnet_association" {
    subnet_id = "${var.public_subnet_us_west_1a}"
    route_table_id = "${var.main_route_table_id}"
}
 
resource "aws_route_table_association" "pr_1_subnet_association" {
    subnet_id = "${var.private_1_subnet_us_west_1a}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}
 
resource "aws_route_table_association" "pr_2_subnet_association" {
    subnet_id = "${var.private_2_subnet_us_west_1b}"
    route_table_id = "${aws_route_table.private_route_table.id}"
}
