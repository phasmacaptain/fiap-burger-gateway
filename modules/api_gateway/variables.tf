variable "target_group_port" {
  description = "The port of the target group"
  type        = number
}

variable "dns_name" {
  description = "The DNS name of the load balancer"
  type        = string
}

variable "vpc_link_id" {
  description = "The VPC link ID for the API Gateway"
  type        = string
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

variable "uriECRImage" {
  description = "The URI of the ECR image"
  type        = string
}
