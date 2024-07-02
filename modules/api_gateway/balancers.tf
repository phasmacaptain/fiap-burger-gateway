resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)
}

resource "aws_security_group" "lb_sg" {
  name        = "fiap-burger-lb-sg-gtw"
  description = "Allow HTTP traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "clientes_lb" {
  name               = "clientes-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = aws_subnet.public.*.id
}

resource "aws_lb_target_group" "clientes_tg" {
  name     = "clientes-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "clientes_listener" {
  load_balancer_arn = aws_lb.clientes_lb.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.clientes_tg.arn
  }
}

resource "aws_lb" "pedidos_lb" {
  name               = "pedidos-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = aws_subnet.public.*.id
}

resource "aws_lb_target_group" "pedidos_tg" {
  name     = "pedidos-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "pedidos_listener" {
  load_balancer_arn = aws_lb.pedidos_lb.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pedidos_tg.arn
  }
}

resource "aws_api_gateway_rest_api" "fiap_burger_api" {
  name        = "FiapBurgerAPI"
  description = "API Gateway for FiapBurger"
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
  uri                     = "http://${aws_lb.clientes_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.clients_vpc_link.id
}

resource "aws_api_gateway_integration" "clientes_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = aws_api_gateway_resource.clientes.id
  http_method             = aws_api_gateway_method.clientes_method_get.http_method
  integration_http_method = "GET"
