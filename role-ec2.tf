resource "aws_iam_policy" "ec2_policy" {
  name        = "${random_pet.pet_name.id}-policy"
  description = "My terraform server policy"
  role = "${aws_iam_role.ec2_role.id}"
  policy = "${file("policy.json")}"
}



resource "aws_iam_role" "ec2_role" {
  name = "ec2_k8s_role"
  assume_role_policy = "${file("assume_policy.json")}"
}

resource "aws_iam_policy_attachment" "ec2_policy_attach" {
  name = "ec2_attachment"
  roles = [aws_iam_role.ec2_role.name]
  
  
}

resource "aws_iam_instance_profile" "ec2_proflile" {
  name  = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}
