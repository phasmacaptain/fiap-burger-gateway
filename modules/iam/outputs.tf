output "lambda_exec_role" {
  value = aws_iam_role.lambda_exec.arn
}

output "api_gateway_role" {
  value = aws_iam_role.api_gateway_role.arn
}
