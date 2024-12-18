resource "aws_iam_user" "example_policy" {
    name = "role_iam"
}

resource "aws_iam_user_policy_attachment" "name" {
    user = aws_iam_user.example_policy.name
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
  