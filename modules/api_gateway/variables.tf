variable "target_group_port" {
  description = "The port of the target group"
  type        = number
}


variable "api_gateway_role" {
  description = "The ARN of the IAM role for API Gateway"
  type        = string
}

variable "lambda_auth_sign_up" {
  description = "The ARN of the Lambda function for sign up"
  type        = string
}

variable "auth_authorizer_invoke_arn" {
  description = "The ARN of the Lambda function for sign in"
  type        = string
}

variable "lambda_auth_authorizer" {
  description = "The ARN of the Lambda function for authorization"
  type        = string
}

variable "account_id" {
  description = "Account ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_a" {
  description = "Subnet S"
  type        = string
}

variable "subnet_b" {
  description = "Subnet S"
  type        = string
}

variable "subnet_c" {
  description = "Subnet C"
  type        = string
}

