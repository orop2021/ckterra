output "public-ip" {
  value = aws_instance.master1-k8s.public_ip
}
output "public-ip-address" {
  value = aws_instance.node1-k8s.associate_public_ip_address
}

output "public-dns" {
  value = aws_instance.node2-k8s.arn

}
