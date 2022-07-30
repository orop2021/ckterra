resource "aws_iam_policy" "ec2_policy" {
  name        = "K8s-exam-policy"
  description = "My terraform server policy"
  policy = "${file("policy.json")}"
}



resource "aws_iam_role" "k8s_exam_ec2_role" {
  name = "ec2_exam_k8s_role"
  assume_role_policy = "${file("assume_policy.json")}"
}

resource "aws_iam_policy_attachment" "k8s_policy_attach" {
  name = "kubernetes attachment"
  roles = [aws_iam_role.k8s_exam_ec2_role.name]
  policy_arn = aws_iam_policy.ec2_policy.arn
  
}

resource "aws_iam_instance_profile" "ec2_proflile" {
  name  = "ec2_k8s_profile"
  role = aws_iam_role.k8s_exam_ec2_role.name
}
