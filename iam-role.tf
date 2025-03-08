resource "aws_iam_role" "iamrole" {
  name               = "ECS-execution-role"
  assume_role_policy = file("${path.module}/iam-role.json")
}