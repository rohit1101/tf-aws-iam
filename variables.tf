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
  description = "AWS Managed EC2 Full Access Policy ARN"
}

variable "aws_iam_group_name" {
  type    = string
  default = "test-group"
}


variable "aws_iam_group_tag" {
  type = map(string)
  default = {
    "name" = "tf-created"
  }
}

variable "aws_iam_group_policy_arn" {
  type = string
  # default     = "arn:aws:iam::aws:policy/AdministratorAccess"
  default     = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  description = "AWS Managed IAM Admin Access Policy ARN"
}
