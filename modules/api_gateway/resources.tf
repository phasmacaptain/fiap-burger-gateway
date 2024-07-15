data "aws_api_gateway_resource" "cliente_by_cpf" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/cliente/{cpf}"
}

data "aws_api_gateway_resource" "pedido" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/pedido"
}

data "aws_api_gateway_resource" "pedido_by_id" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/pedido/{id}"
}

data "aws_api_gateway_resource" "pedido_avaliar" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/pedido/avaliar"
}

data "aws_api_gateway_resource" "pedido_listar" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/pedido/listar/{id_status}"
}

data "aws_api_gateway_resource" "pedido_atualizar_status" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/pedido/atualizar-status"
}

data "aws_api_gateway_resource" "pedido_efetuar_pagamento" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/pedido/efetuar-pagamento"
}

data "aws_api_gateway_resource" "produtos" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/produtos"
}

data "aws_api_gateway_resource" "produtos_by_id" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/produtos/{id}"
}

data "aws_api_gateway_resource" "produtos_categoria" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/produtos/categoria/{id_category}"
}

data "aws_api_gateway_resource" "integration_pagamento" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/pagamento"
}

data "aws_api_gateway_resource" "integration_pagamento_get_by_id" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/pagamento/{id}"
}

data "aws_api_gateway_resource" "integration_pagamento_get_status" {
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  path   = "/pagamento/consultar/{id}"
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
