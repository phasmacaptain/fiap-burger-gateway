resource "aws_api_gateway_rest_api" "fiap_burger_api" {
  name        = "FiapBurgerAPI"
  description = "API Gateway para o FiapBurger"

 body = templatefile(
    "${path.module}/../contrato/.generated/fiap-burger.yaml",
    {
      target_group_port          = var.target_group_port
      dns_name                   = data.aws_lb.load_balancer.dns_name
      vpc_link_id                = aws_api_gateway_vpc_link.vpc_link.id
      api_gateway_role           = aws_iam_role.api_gateway_lambda.arn
      lambda_auth_sign_up_arn    = data.aws_lambda_function.auth_sign_up.invoke_arn
      lambda_auth_sign_in_arn    = data.aws_lambda_function.auth_sign_in.invoke_arn
      lambda_auth_authorizer_arn = data.aws_lambda_function.auth_authorizer.invoke_arn
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

resource "aws_api_gateway_method" "clientes_method" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.clientes.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "pedidos_method" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.pedidos.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "produtos_method" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.produtos.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_method" "checkout_method" {
  rest_api_id   = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id   = aws_api_gateway_resource.checkout.id
  http_method   = "ANY"
  authorization = "NONE"
}

# Definir integração com o serviço Lambda ou outros serviços backend
resource "aws_api_gateway_integration" "clientes_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.clientes.id
  http_method             = aws_api_gateway_method.clientes_method.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

resource "aws_api_gateway_integration" "pedidos_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.pedidos.id
  http_method             = aws_api_gateway_method.pedidos_method.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

resource "aws_api_gateway_integration" "produtos_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.produtos.id
  http_method             = aws_api_gateway_method.produtos_method.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

resource "aws_api_gateway_integration" "checkout_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.checkout.id
  http_method             = aws_api_gateway_method.checkout_method.http_method
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = var.uriECRImage
}

# Deploy do API Gateway
resource "aws_api_gateway_deployment" "fiap_burger_deployment" {
  depends_on = [
    aws_api_gateway_integration.clientes_integration,
    aws_api_gateway_integration.pedidos_integration,
    aws_api_gateway_integration.produtos_integration,
    aws_api_gateway_integration.checkout_integration
  ]
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  stage_name  = "prod"
}

# Configurar permissões para o API Gateway acessar os serviços backend
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

resource "aws_api_gateway_vpc_link" "vpc_link" {
  name        = "fiap-burger-vpc-link"
  target_arns = [data.aws_lb.load_balancer.arn]
}

data "aws_iam_policy_document" "api_gateway" {
  statement {
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions   = ["execute-api:Invoke"]
    resources = ["${aws_api_gateway_rest_api.api_gateway.execution_arn}/*/*/*"]
  }
}

resource "aws_api_gateway_rest_api_policy" "api_gateway" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  policy      = data.aws_iam_policy_document.api_gateway.json
}

resource "aws_api_gateway_deployment" "api_gateway" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.api_gateway.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "api_gateway" {
  stage_name    = "live"
  deployment_id = aws_api_gateway_deployment.api_gateway.id
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
}

