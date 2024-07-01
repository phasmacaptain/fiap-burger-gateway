resource "aws_lambda_function" "auth_sign_up" {
  function_name = "auth-authorizer"
  handler       = "authorizer.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_exec.arn
  filename      = "${path.module}/authorizer.zip"
  
  source_code_hash = filebase64sha256("${path.module}/authorizer.zip")
  
  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
}


resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_exec.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}