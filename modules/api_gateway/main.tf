resource "aws_api_gateway_rest_api" "fiap_burger_api" {
  name        = "FiapBurgerAPI"
  description = "API Gateway para o FiapBurger"

  body = templatefile(
    "${path.module}/../../contrato/fiap-burger.yaml",
    {
      target_group_port          = var.target_group_port,
      dns_name                   = var.dns_name,
      api_gateway_role           = "arn:aws:iam::641207671710:role/LabRole",
      lambda_auth_authorizer_arn = var.lambda_auth_authorizer
    }
  )

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_authorizer" "lambda_authorizer" {
  name                    = "LambdaAuthorizer"
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  authorizer_uri          = var.auth_authorizer_invoke_arn
  authorizer_credentials  = "arn:aws:iam::641207671710:role/LabRole"
  identity_source         = "method.request.header.Authorization"
  authorizer_result_ttl_in_seconds = 300
  type                    = "TOKEN"
}
