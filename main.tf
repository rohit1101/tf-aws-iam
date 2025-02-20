resource "aws_iam_user" "test" {
  for_each = var.aws_iam_username
  name     = each.key
  tags = {
    name = "tf-created-${each.value}"
  }
}

resource "aws_iam_user_login_profile" "test_user_login_profile" {
  for_each                = var.aws_iam_username
  user                    = aws_iam_user.test[each.key].name
  password_length         = var.aws_iam_user_login_profile_password_len
  password_reset_required = false
  # pgp_key = "keybase:your_key" can be used if the password requires encoding 
}


data "aws_iam_policy" "iamadmin_policy" {
  arn = var.aws_iam_policy_arn
}

resource "aws_iam_user_policy_attachment" "test_attachment" {
  for_each   = var.aws_iam_username
  policy_arn = data.aws_iam_policy.iamadmin_policy.arn
  user       = aws_iam_user.test[each.key].name
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
  for_each = var.aws_iam_username
  user     = aws_iam_user.test[each.key].name
  groups   = [aws_iam_group.test_group.name]
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"
  
  principals {
    type= "Service"
    identifiers=["lambda.amazonaws.com" ]
  }
  actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "test_role" {
  name="test-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags={
    "created_by":"tf-created-role"
  }
}

data "aws_iam_policy" "iamadmin_role_policy" {
  # name = "test-role-policy"
  arn = var.aws_iam_role_policy_arn
}

resource "aws_iam_role_policy_attachment" "test_role_attach" {
  policy_arn = data.aws_iam_policy.iamadmin_role_policy.arn
  role= aws_iam_role.test_role.name

}