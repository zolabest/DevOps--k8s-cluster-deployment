# Outputs for VPC
output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.example_vpc.id
}

output "subnet_id" {
  description = "The ID of the created Subnet"
  value       = aws_subnet.example_subnet.id
}

output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "The public IP address of the created EC2 instance"
  value       = aws_instance.example.public_ip
}