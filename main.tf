module "lambda" {
  source           = "./modules/lambda"
  lambda_exec_role = "arn:aws:iam::${var.account_id}:role/LabRole"
  account_id                    = var.account_id
}

module "api_gateway" {
  source                        = "./modules/api_gateway"
  lambda_auth_sign_up           = module.lambda.auth_sign_up_arn
  auth_authorizer_invoke_arn    = module.lambda.auth_authorizer_invoke_arn
  lambda_auth_authorizer        = module.lambda.auth_authorizer_arn
  api_gateway_role              = "arn:aws:iam::643230847802:role/LabRole"
  target_group_port             = var.target_group_port
  dns_name                      = var.dns_name
  account_id                    = var.account_id
  vpc_id                        = var.vpc_id
  subnet_a                      = var.subnet_a
  subnet_b                      = var.subnet_b
  subnet_c                      = var.subnet_c
}
