
output "iamadmin_userpassword" {
  value     = [for out in values(aws_iam_user_login_profile.test_user_login_profile) : "${out.id}'s password is (${out.password})"]
  sensitive = true
}
