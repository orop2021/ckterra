# create a SG for master-server 
resource "aws_security_group" "main_web_sg" {
  name        = "K8s-web-SG"
  description = "all inbound traffic to our Master-Server"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrule
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["172.31.0.0/16"]
    }
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# create a SG for node-server 
resource "aws_security_group" "node-sg" {
  name = "Node-${var.env}-sg"
  description = "Node Server access"
  dynamic "ingress" {
    iterator = port
    for_each = var.node-ingressrule
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


