#!/bin/bash
# Installs Apache on Amazon Linux 2023 and serves a simple page.
set -euxo pipefail

dnf update -y
dnf install -y httpd

systemctl enable --now httpd

# IMDSv2 token to read instance metadata
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 60")
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
  <head><title>Capstone Project 1</title></head>
  <body style="font-family: sans-serif; text-align: center; margin-top: 15%;">
    <h1>Hello from Terraform + EC2 🚀</h1>
    <p>Capstone Project 1: Linux web server deployed with Infrastructure as Code.</p>
    <p>Instance: ${INSTANCE_ID} | AZ: ${AZ}</p>
  </body>
</html>
EOF