# Provider Configuration
provider "aws" {
  region = var.region
}

# EC2 Instance using VPC and Security Group
resource "aws_instance" "example" {
  ami = "ami-085ad6ae776d8f09c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.example_subnet.id
  vpc_security_group_ids = [aws_security_group.example_sg.id]
  tags = {
    Name = "ExampleInstance"
  }
}