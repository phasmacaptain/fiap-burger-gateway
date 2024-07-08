resource "aws_api_gateway_integration" "clientes_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.clientes.id
  http_method             = "POST"
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.clients_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.clients_vpc_link.id
}

resource "aws_api_gateway_integration" "clientes_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.clientes.id
  http_method             = "GET"
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.clients_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.clients_vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.pedidos.id
  http_method             = "POST"
  integration_http_method = "POST"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.pedidos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.pedidos_vpc_link.id
}

resource "aws_api_gateway_integration" "pedidos_integration_get" {
  rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
  resource_id             = data.aws_api_gateway_resource.pedidos.id
  http_method             = "GET"
  integration_http_method = "GET"
  type                    = "HTTP_PROXY"
  uri                     = "http://${aws_lb.pedidos_fiap_burger_lb.dns_name}"
  connection_type         = "VPC_LINK"
  connection_id           = aws_api_gateway_vpc_link.pedidos_vpc_link.id
}

resource "aws_api_gateway_integration" "produtos_integration" {
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

# resource "aws_api_gateway_integration" "checkout_integration" {
#   rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
#   resource_id             = aws_api_gateway_resource.checkout.id
#   http_method             = aws_api_gateway_method.checkout_method_post.http_method
#   integration_http_method = "POST"
#   type                    = "HTTP_PROXY"
#   uri                     = "http://${aws_lb.checkout_fiap_burger_lb.dns_name}"
#   connection_type         = "VPC_LINK"
#   connection_id           = aws_api_gateway_vpc_link.checkout_vpc_link.id
# }

# resource "aws_api_gateway_integration" "categorias_integration" {
#   rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
#   resource_id             = aws_api_gateway_resource.categorias.id
#   http_method             = aws_api_gateway_method.categorias_method_post.http_method
#   integration_http_method = "POST"
#   type                    = "HTTP_PROXY"
#   uri                     = "http://${aws_lb.categorias_fiap_burger_lb.dns_name}"
#   connection_type         = "VPC_LINK"
#   connection_id           = aws_api_gateway_vpc_link.categorias_vpc_link.id
# }

# resource "aws_api_gateway_integration" "categorias_integration_get" {
#   rest_api_id             = aws_api_gateway_rest_api.fiap_burger_api.id
#   resource_id             = aws_api_gateway_resource.categorias.id
#   http_method             = aws_api_gateway_method.categorias_method_get.http_method
#   integration_http_method = "GET"
#   type                    = "HTTP_PROXY"
#   uri                     = "http://${aws_lb.categorias_fiap_burger_lb.dns_name}"
#   connection_type         = "VPC_LINK"
#   connection_id           = aws_api_gateway_vpc_link.categorias_vpc_link.id
# }
