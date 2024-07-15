output "api_gateway_id" {
  value = aws_api_gateway_rest_api.fiap_burger_api.id
}

output "api_gateway_root_resource_id" {
  value = aws_api_gateway_rest_api.fiap_burger_api.root_resource_id
}
