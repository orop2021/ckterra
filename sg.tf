# create a SG for web servers in main region
resource "aws_security_group" "main_web_sg" {
  name        = "K8s-web-SG"
  description = "all inbound traffic to web server"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrule
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


