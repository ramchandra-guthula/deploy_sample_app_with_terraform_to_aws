# Creating VPC S3 endpoint to have connectivity to S3 from private subnet instead of NAT gateway

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.myapp-vpc.id
  service_name = "com.amazonaws.us-east-1.s3"

  tags = local.env_tags
}

resource "aws_vpc_endpoint_route_table_association" "s3_endpoint_rt" {
  route_table_id  = aws_route_table.myapp-private-subnet-rt.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

