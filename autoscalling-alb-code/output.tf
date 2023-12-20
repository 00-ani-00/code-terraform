output "dns_lb" {
  description = "DNS of loadbalancer"
  value       = aws_lb.my-alb.dns_name

}
