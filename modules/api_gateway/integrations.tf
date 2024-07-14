resource "aws_api_gateway_integration" "clientes_integration_post" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.cliente.id
  http_method             = "POST"
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.clients_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.clients_vpc_link.id
}

resource "aws_api_gateway_integration" "clientes_integration_patch" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.cliente.id
  http_method             = "PATCH"
  integration_http_method = "PATCH"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.clients_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.clients_vpc_link.id
}

resource "aws_api_gateway_integration" "clientes_integration_get_by_cpf" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.cliente_by_cpf.id
  http_method             = "GET"
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.clients_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.clients_vpc_link.id
}

resource "aws_api_gateway_integration" "clientes_integration_delete_by_cpf" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.cliente_by_cpf.id
  http_method             = "DELETE"
  integration_http_method = "DELETE"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.clients_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.clients_vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration_post" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.pedido.id
  http_method             = "POST"
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.pedidos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.pedidos_vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration_delete" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.pedido.id
  http_method             = "DELETE"
  integration_http_method = "DELETE"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.pedidos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.pedidos_vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.pedido.id
  http_method             = "GET"
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.pedidos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.pedidos_vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration_get_by_cpf" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.pedido_by_id.id
  http_method             = "GET"
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.pedidos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.pedidos_vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration_post_avaliar" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.pedido_avaliar.id
  http_method             = "POST"
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.pedidos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.pedidos_vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration_get_listar" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.pedido_listar.id
  http_method             = "GET"
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.produtos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.produtos_vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration_post_atualizar_status" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.pedido_atualizar_status.id
  http_method             = "PATCH"
  integration_http_method = "PATCH"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.produtos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.produtos_vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration_post_efetuar_pagamento" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.pedido_efetuar_pagamento.id
  http_method             = "POST"
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.produtos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.produtos_vpc_link.id
}

resource "aws_api_gateway_integration" "produtos_integration_post" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.produtos.id
  http_method             = "POST"
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.produtos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.produtos_vpc_link.id
}

resource "aws_api_gateway_integration" "produtos_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.produtos.id
  http_method             = "GET"
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.produtos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.produtos_vpc_link.id
}

resource "aws_api_gateway_integration" "produtos_integration_get_by_id" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.produtos_by_id.id
  http_method             = "GET"
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.produtos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.produtos_vpc_link.id
}

resource "aws_api_gateway_integration" "produtos_integration_put_by_id" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.produtos_by_id.id
  http_method             = "PUT"
  integration_http_method = "PUT"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.produtos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.produtos_vpc_link.id
}

resource "aws_api_gateway_integration" "produtos_integration_delete_by_id" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.produtos_by_id.id
  http_method             = "DELETE"
  integration_http_method = "DELETE"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.produtos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.produtos_vpc_link.id
}

resource "aws_api_gateway_integration" "produtos_integration_get_categoria" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.produtos_categoria.id
  http_method             = "GET"
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.produtos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.produtos_vpc_link.id
}
