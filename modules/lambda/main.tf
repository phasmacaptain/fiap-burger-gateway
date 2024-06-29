resource "aws_lambda_function" "auth_sign_up" {
  function_name = "auth-sign-up"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = var.lambda_exec_role
  filename      = "path/to/auth-sign-up.zip"
}

resource "aws_lambda_function" "auth_sign_in" {
  function_name = "auth-sign-in"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = var.lambda_exec_role
  filename      = "path/to/auth-sign-in.zip"
}

resource "aws_lambda_function" "auth_authorizer" {
  function_name = "auth-authorizer"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  role          = var.lambda_exec_role
  filename      = "path/to/auth-authorizer.zip"
}
