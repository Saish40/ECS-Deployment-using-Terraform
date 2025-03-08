resource "aws_iam_role_policy" "policy" {
  name   = "ECS-ececution-role-policy"
  role   = aws_iam_role.iamrole.id
  policy = file("${path.module}/iam-policy.json")
}