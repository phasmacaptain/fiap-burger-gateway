resource "aws_lambda_function" "auth_sign_up" {
  function_name = "auth-authorizer"
  handler       = "authorizer.lambda_handler"
  runtime       = "python3.8"
  role          = "arn:aws:iam::641207671710:role/LabRole"
  filename      = "${path.module}/authorizer.zip"
  
  source_code_hash = filebase64sha256("${path.module}/authorizer.zip")
  
  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
}
