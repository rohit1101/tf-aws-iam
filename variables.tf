variable "aws_iam_username" {
  type        = string
  default     = "iamadmin-tf"
  description = "Name of the iam user"
}

variable "aws_iam_username_tags" {
  type = map(string)
  default = {
    "name" = "tf-created"
  }
  description = "tag for IAM user"

}

variable "aws_iam_user_login_profile_password_len" {
  type        = number
  default     = 10
  description = "Password length"
}

variable "aws_iam_policy_arn" {
  type        = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
  description = "AWS Managed IAM Admin Access Policy ARN"
}

# variable "aws_secret_key" {
#   type = string
#   # sensitive = true
# }
