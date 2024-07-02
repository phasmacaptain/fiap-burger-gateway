module "lambda" {
  source           = "./modules/lambda"
  lambda_exec_role = "arn:aws:iam::641207671710:role/LabRole"
}

module "api_gateway" {
  source                        = "./modules/api_gateway"
  lambda_auth_sign_up           = module.lambda.auth_sign_up_arn
  auth_authorizer_invoke_arn    = module.lambda.auth_authorizer_invoke_arn
  lambda_auth_authorizer        = module.lambda.auth_authorizer_arn
  api_gateway_role              = "arn:aws:iam::641207671710:role/LabRole"
  target_group_port             = var.target_group_port
  dns_name                      = var.dns_name
}
