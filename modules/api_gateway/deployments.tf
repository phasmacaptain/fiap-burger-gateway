resource "aws_api_gateway_deployment" "fiap_burger_deployment" {
  depends_on = [
    aws_api_gateway_integration.clientes_integration,
    aws_api_gateway_integration.clientes_integration_post,
    aws_api_gateway_integration.clientes_integration_patch,
    aws_api_gateway_integration.clientes_integration_get_by_cpf,
    aws_api_gateway_integration.clientes_integration_delete_by_cpf,
    aws_api_gateway_integration.pedidos_integration_post,
    aws_api_gateway_integration.pedidos_integration_delete,
    aws_api_gateway_integration.pedidos_integration_get,
    aws_api_gateway_integration.pedidos_integration_get_by_cpf,
    aws_api_gateway_integration.pedidos_integration_post_avaliar,
    aws_api_gateway_integration.pedidos_integration_get_listar,
    aws_api_gateway_integration.pedidos_integration_post_atualizar_status,
    aws_api_gateway_integration.pedidos_integration_post_efetuar_pagamento,
    aws_api_gateway_integration.produtos_integration_post,
    aws_api_gateway_integration.produtos_integration_get,
    aws_api_gateway_integration.produtos_integration_get_by_id,
    aws_api_gateway_integration.produtos_integration_put_by_id,
    aws_api_gateway_integration.produtos_integration_delete_by_id,
    aws_api_gateway_integration.produtos_integration_get_categoria
  ]
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  stage_name  = "prod"
}
