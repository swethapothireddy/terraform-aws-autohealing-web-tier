########################################
# AWS Region
########################################
variable "aws_region" {
  description = "AWS region where the infrastructure will be planned"
  default     = "ap-southeast-2"
}

########################################
# EC2 Instance Type
########################################
variable "instance_type" {
  description = "EC2 instance type for web servers"
  default     = "t3.micro"
}

########################################
# Auto Scaling Group Desired Capacity
########################################
variable "desired_capacity" {
  description = "Number of EC2 instances to run normally"
  default     = 2
}

########################################
# Auto Scaling Group Minimum Size
########################################
variable "min_size" {
  description = "Minimum number of EC2 instances (ensures N+1 availability)"
  default     = 2
}

########################################
# Auto Scaling Group Maximum Size
########################################
variable "max_size" {
  description = "Maximum number of EC2 instances allowed"
  default     = 3
}
