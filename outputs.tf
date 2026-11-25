output "public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web.public_ip
}

output "website_url" {
  description = "URL to open in your browser"
  value       = "http://${aws_instance.web.public_ip}"
}
