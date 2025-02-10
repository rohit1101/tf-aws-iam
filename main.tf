resource "aws_iam_user" "test" {
  name = var.aws_iam_username
  tags = var.aws_iam_username_tags
}

resource "aws_iam_user_login_profile" "test_user_login_profile" {
  user                    = aws_iam_user.test.name
  password_length         = var.aws_iam_user_login_profile_password_len
  password_reset_required = false
  # pgp_key = "keybase:your_key" can be used if the password requires encoding 
}


data "aws_iam_policy" "iamadmin_policy" {
  arn = var.aws_iam_policy_arn
}

resource "aws_iam_user_policy_attachment" "test_attachment" {
  policy_arn = data.aws_iam_policy.iamadmin_policy.arn
  user       = aws_iam_user.test.name
}

# resource "aws_iam_account_alias" "test_account_alias" {
#   account_alias = "non-linear-trap"
# }


resource "aws_iam_group" "test_group" {
  name = var.aws_iam_group_name
}

data "aws_iam_policy" "iamadmin_group_policy" {
  arn = var.aws_iam_group_policy_arn
}

resource "aws_iam_group_policy_attachment" "test-group-attach" {
  group      = aws_iam_group.test_group.name
  policy_arn = data.aws_iam_policy.iamadmin_group_policy.arn
}

resource "aws_iam_user_group_membership" "test_user_group_attach" {
  user   = aws_iam_user.test.name
  groups = [aws_iam_group.test_group.name]
}
