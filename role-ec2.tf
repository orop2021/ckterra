resource "aws_iam_policy" "ec2_policy" {
  name        = "K8s-policy"
  description = "My terraform server policy"
  policy = "${file("policy.json")}"
}



resource "aws_iam_role" "ec2_role" {
  name = "ec2_k8s_role"
  assume_role_policy = "${file("assume_policy.json")}"
}

resource "aws_iam_instance_profile" "ec2_proflile" {
  name  = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}
