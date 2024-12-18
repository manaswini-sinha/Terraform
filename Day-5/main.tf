resource "aws_vpc" "dev_local_vpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
      Name ="dev_vpc"
    }

}
#create public subnet
resource "aws_subnet" "dev_local_sb" {
    vpc_id = aws_vpc.dev_local_vpc.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name="dev_subnet"
    }
  
}
#create private subnet for nat gate
resource "aws_subnet" "prvt_subnet" {
  vpc_id = aws_vpc.dev_local_vpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name="dev_subnet_private"
    }
}
#create internet gateway
resource "aws_internet_gateway" "dev_local_ig" {
    vpc_id = aws_vpc.dev_local_vpc.id
    
    tags = {
        Name="dev_ig"
    }
  
}
#create route table
resource "aws_route_table" "dev_local_rt" {
    vpc_id = aws_vpc.dev_local_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev_local_ig.id
    }
   
  
}
resource "aws_route_table_association" "dev_local_sb_asso" {
    subnet_id = aws_subnet.dev_local_sb.id
    route_table_id = aws_route_table.dev_local_rt.id

}


resource "aws_security_group" "allow_tls" {
    name = "my_sg"
    vpc_id = aws_vpc.dev_local_vpc.id
    tags={
        Name="my_sg"
    }
  ingress {
    description = "Tls from vpc"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "tls from vpc"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#create elastic ip
resource "aws_eip" "dev_eip" {
  
  tags = {
    Name = "ExampleElasticIP"
  }
}
#create nat gateway
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.dev_eip.id
  subnet_id     = aws_subnet.dev_local_sb.id

  tags = {
    Name = "ExampleNATGateway"
  }
}
#create route table for private subnet
resource "aws_route_table" "prvt_rt" {
  vpc_id = aws_vpc.dev_local_vpc.id
  tags={
    Name = "Private_Rt"
  }
}
#create subnet association to private route table
resource "aws_route_table_association" "private_association" {
  subnet_id = aws_subnet.prvt_subnet.id
  route_table_id = aws_route_table.prvt_rt.id

}
#add the nat gateway to rt
resource "aws_route" "prvt_rt" {
  route_table_id = aws_route_table.prvt_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.example.id
}
