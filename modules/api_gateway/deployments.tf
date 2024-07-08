resource "aws_api_gateway_deployment" "fiap_burger_deployment" {
  depends_on = [
    aws_api_gateway_integration.clientes_integration,
    aws_api_gateway_integration.pedidos_integration,
    aws_api_gateway_integration.produtos_integration,
    # aws_api_gateway_integration.checkout_integration,
    # aws_api_gateway_integration.categorias_integration,
    aws_api_gateway_integration.clientes_integration_get,
    aws_api_gateway_integration.pedidos_integration_get,
    aws_api_gateway_integration.produtos_integration_get,
    # aws_api_gateway_integration.categorias_integration_get
  ]
  rest_api_id = aws_api_gateway_rest_api.fiap_burger_api.id
  stage_name  = "prod"
}
