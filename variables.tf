variable "aws_region" {
  default = "ap-southeast-2"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "desired_capacity" {
  default = 2
}

variable "min_size" {
  default = 2
}

variable "max_size" {
  default = 3
}
