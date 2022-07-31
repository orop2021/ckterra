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

resource "aws_security_group_rule" "Master-sg-rule" {
  for_each = var.master-ingressrule
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = each.value.cidr
  security_group_id = aws_security_group.main_web_sg.id
}

# create a SG for node-server 
resource "aws_security_group" "node-sg" {
  name = "Node-${var.env}-sg"
  description = "Node Server access"
  tags = {
    Name        = "Node-${var.env}-sg"
    Environment = var.env
  }
}

resource "aws_security_group_rule" "node-sg-rule" {
  for_each = var.node-ingressrule
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = each.value.cidr
  security_group_id = aws_security_group.node-sg.id
}


