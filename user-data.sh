#!/bin/bash
# User-data script for Auto Scaling EC2 instances

# Update system
yum update -y

# Install Docker
amazon-linux-extras install docker -y

# Start Docker service
systemctl start docker
systemctl enable docker

# Allow ec2-user to run docker commands
usermod -a -G docker ec2-user

# Pull Docker image from Docker Hub
docker pull swethareddy2/autohealing-web:latest

# Run NGINX container
docker run -d \
  --name autohealing-web \
  -p 80:80 \
  --restart always \
  swethareddy2/autohealing-web:latest
