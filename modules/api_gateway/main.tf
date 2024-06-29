resource "aws_api_gateway_rest_api" "fiap_burger_api" {
  name        = "FiapBurgerAPI"
  description = "API Gateway para o FiapBurger"

  body = templatefile(
    "${path.module}/../../contrato/fiap-burger.yaml",
    {
      target_group_port          = var.target_group_port
      dns_name                   = var.dns_name
      vpc_link_id                = var.vpc_link_id
      api_gateway_role           = var.api_gateway_role
      lambda_auth_sign_up_arn    = var.lambda_auth_sign_up
      lambda_auth_sign_in_arn    = var.lambda_auth_sign_in
      lambda_auth_authorizer_arn = var.lambda_auth_authorizer
    }
  )

  endpoint_configuration {
    types = ["REGIONAL"]
  }
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
  authorization = "NONE"
}

resource "aws_api_gateway_method" "clientes_method_get" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.clientes.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "pedidos_method_any" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.pedidos.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "pedidos_method_get" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.pedidos.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "produtos_method_any" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.produtos.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "produtos_method_get" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.produtos.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "checkout_method_any" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.checkout.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "categorias_method_get" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.categorias.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "categorias_method_any" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.categorias.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "clientes_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.clientes.id
  http_method             = aws_api_gateway_method.clientes_method_any.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

resource "aws_api_gateway_integration" "clientes_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.clientes.id
  http_method             = aws_api_gateway_method.clientes_method_get.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

resource "aws_api_gateway_integration" "pedidos_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.pedidos.id
  http_method             = aws_api_gateway_method.pedidos_method_any.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

resource "aws_api_gateway_integration" "pedidos_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.pedidos.id
  http_method             = aws_api_gateway_method.pedidos_method_get.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

resource "aws_api_gateway_integration" "produtos_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.produtos.id
  http_method             = aws_api_gateway_method.produtos_method_any.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

resource "aws_api_gateway_integration" "produtos_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.produtos.id
  http_method             = aws_api_gateway_method.produtos_method_get.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

resource "aws_api_gateway_integration" "checkout_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.checkout.id
  http_method             = aws_api_gateway_method.checkout_method_any.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

resource "aws_api_gateway_integration" "categorias_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.categorias.id
  http_method             = aws_api_gateway_method.categorias_method_any.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

resource "aws_api_gateway_integration" "categorias_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.categorias.id
  http_method             = aws_api_gateway_method.categorias_method_get.http_method
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
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
