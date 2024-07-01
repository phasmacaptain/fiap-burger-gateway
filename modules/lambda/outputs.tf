output "auth_sign_up_arn" {
  value = aws_lambda_function.auth_sign_up.arn
}

output "auth_sign_in_arn" {
  value = aws_lambda_function.auth_sign_up.arn
}

output "auth_authorizer_arn" {
  value = aws_lambda_function.auth_sign_up.arn
}

output "auth_authorizer_invoke_arn" {
  value = aws_lambda_function.auth_sign_up.invoke_arn
}
