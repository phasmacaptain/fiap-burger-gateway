data "aws_api_gateway_resource" "clientes" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/clientes"
}

data "aws_api_gateway_resource" "pedidos" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/pedidos"
}

data "aws_api_gateway_resource" "produtos" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/produtos"
}

# resource "aws_api_gateway_resource" "checkout" {
#   rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
#   path   = "/checkout"
# }

# resource "aws_api_gateway_resource" "categorias" {
#   rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
#   parent_id   = aws_api_gateway_rest_api.fiap_burger_api.root_resource_id
#   path_part   = "categorias"
# }
