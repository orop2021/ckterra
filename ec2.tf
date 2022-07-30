
resource "aws_instance" "master1-k8s" {
  ami                    = var.ami
  instance_type          = var.instance_type
  iam_instance_profile   = aws_iam_instance_profile.ec2_proflile.name
  vpc_security_group_ids = [aws_security_group.main_web_sg.id]
  key_name               = var.keypair
  user_data = "${file("user-data.sh")}"
  tags = {
    Name = var.master-name
    Env  = var.env
  }
}

resource "aws_instance" "node1-k8s" {
  ami           = var.ami
  instance_type = var.node_instance_type
  vpc_security_group_ids = [aws_security_group.main_web_sg.id]
  key_name      = var.keypair
  user_data = "${file("user-data.sh")}"
  tags = {
    Name = var.node1-name
    Env  = var.env
  }
}

resource "aws_instance" "node2-k8s" {
  ami           = var.ami
  instance_type = var.node_instance_type
  vpc_security_group_ids = [aws_security_group.main_web_sg.id]
  key_name      = var.keypair
  user_data = "${file("user-data.sh")}"
  tags = {
    Name = var.node2-name
    Env  = var.env
  }
}