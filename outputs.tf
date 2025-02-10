
output "iamadmin_userpassword" {
  value     = aws_iam_user_login_profile.test_user_login_profile.password
  sensitive = true
}
