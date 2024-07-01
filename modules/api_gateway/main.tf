resource "aws_api_gateway_rest_api" "fiap_burger_api" {
  name        = "FiapBurgerAPI"
  description = "API Gateway para o FiapBurger"

  body = templatefile(
    "${path.module}/../../contrato/fiap-burger.yaml",
    {
      target_group_port          = var.target_group_port
      dns_name                   = var.dns_name
      api_gateway_role           = var.api_gateway_role
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
  authorizer_credentials  = aws_iam_role.api_gateway_role.arn
  identity_source         = "method.request.header.Authorization"
  authorizer_result_ttl_in_seconds = 300
  type                    = "TOKEN"
}


resource "aws_api_gateway_resource" "clientes" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  parent_id   = aws_api_gateway_rest_api.fiap_burger_api.root_resource_id
  path_part   = "clientes"
}

resource "aws_api_gateway_resource" "pedidos" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  parent_id   = aws_api_gateway_rest_api.fiap_burger_api.root_resource_id
  path_part   = "pedidos"
}

resource "aws_api_gateway_resource" "produtos" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  parent_id   = aws_api_gateway_rest_api.fiap_burger_api.root_resource_id
  path_part   = "produtos"
}

resource "aws_api_gateway_resource" "checkout" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  parent_id   = aws_api_gateway_rest_api.fiap_burger_api.root_resource_id
  path_part   = "checkout"
}

resource "aws_api_gateway_resource" "categorias" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  parent_id   = aws_api_gateway_rest_api.fiap_burger_api.root_resource_id
  path_part   = "categorias"
}

resource "aws_api_gateway_method" "clientes_method_any" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.clientes.id
  http_method   = "ANY"
  authorization = "CUSTOM"
  authorizer_id = aws_api_gateway_authorizer.lambda_authorizer.id
}

resource "aws_api_gateway_method" "clientes_method_get" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.clientes.id
  http_method   = "GET"
  authorization = "CUSTOM"
  authorizer_id = aws_api_gateway_authorizer.lambda_authorizer.id
}

resource "aws_api_gateway_method" "pedidos_method_any" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.pedidos.id
  http_method   = "ANY"
  authorization = "CUSTOM"
  authorizer_id = aws_api_gateway_authorizer.lambda_authorizer.id
}

resource "aws_api_gateway_method" "pedidos_method_get" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.pedidos.id
  http_method   = "GET"
  authorization = "CUSTOM"
  authorizer_id = aws_api_gateway_authorizer.lambda_authorizer.id
}

resource "aws_api_gateway_method" "produtos_method_any" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.produtos.id
  http_method   = "ANY"
  authorization = "CUSTOM"
  authorizer_id = aws_api_gateway_authorizer.lambda_authorizer.id
}

resource "aws_api_gateway_method" "produtos_method_get" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.produtos.id
  http_method   = "GET"
  authorization = "CUSTOM"
  authorizer_id = aws_api_gateway_authorizer.lambda_authorizer.id
}

resource "aws_api_gateway_method" "checkout_method_any" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.checkout.id
  http_method   = "ANY"
  authorization = "CUSTOM"
  authorizer_id = aws_api_gateway_authorizer.lambda_authorizer.id
}

resource "aws_api_gateway_method" "categorias_method_get" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.categorias.id
  http_method   = "GET"
  authorization = "CUSTOM"
  authorizer_id = aws_api_gateway_authorizer.lambda_authorizer.id
}

resource "aws_api_gateway_method" "categorias_method_any" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.categorias.id
  http_method   = "ANY"
  authorization = "CUSTOM"
  authorizer_id = aws_api_gateway_authorizer.lambda_authorizer.id
}

resource "aws_api_gateway_integration" "clientes_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.clientes.id
  http_method             = aws_api_gateway_method.clientes_method_any.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.clients_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
}

resource "aws_api_gateway_integration" "clientes_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.clientes.id
  http_method             = aws_api_gateway_method.clientes_method_get.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.clients_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.pedidos.id
  http_method             = aws_api_gateway_method.pedidos_method_any.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.pedidos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.pedidos.id
  http_method             = aws_api_gateway_method.pedidos_method_get.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.pedidos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
}

resource "aws_api_gateway_integration" "produtos_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.produtos.id
  http_method             = aws_api_gateway_method.produtos_method_any.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.produtos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
}

resource "aws_api_gateway_integration" "produtos_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.produtos.id
  http_method             = aws_api_gateway_method.produtos_method_get.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.produtos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
}

resource "aws_api_gateway_integration" "checkout_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.checkout.id
  http_method             = aws_api_gateway_method.checkout_method_any.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.checkout_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
}

resource "aws_api_gateway_integration" "categorias_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.categorias.id
  http_method             = aws_api_gateway_method.categorias_method_any.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.categorias_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
}

resource "aws_api_gateway_integration" "categorias_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.categorias.id
  http_method             = aws_api_gateway_method.categorias_method_get.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.categorias_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.vpc_link.id
}

resource "aws_api_gateway_deployment" "fiap_burger_deployment" {
  depends_on = [
    aws_api_gateway_integration.clientes_integration,
    aws_api_gateway_integration.pedidos_integration,
    aws_api_gateway_integration.produtos_integration,
    aws_api_gateway_integration.checkout_integration,
    aws_api_gateway_integration.categorias_integration,
    aws_api_gateway_integration.clientes_integration_get,
    aws_api_gateway_integration.pedidos_integration_get,
    aws_api_gateway_integration.produtos_integration_get,
    aws_api_gateway_integration.categorias_integration_get
  ]
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  stage_name  = "prod"
}

resource "aws_iam_role" "api_gateway_role" {
  name = "api-gateway-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "apigateway.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "api_gateway_policy" {
  name = "api-gateway-policy"
  role = aws_iam_role.api_gateway_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "lambda:InvokeFunction",
          "execute-api:Invoke"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}