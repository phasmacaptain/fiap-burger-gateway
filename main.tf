module "iam" {
  source = "./modules/iam"
}

module "lambda" {
  source           = "./modules/lambda"
  lambda_exec_role = module.iam.lambda_exec_role
}

module "api_gateway" {
  source                = "./modules/api_gateway"
  lambda_auth_sign_up   = module.lambda.auth_sign_up_arn
  lambda_auth_sign_in   = module.lambda.auth_sign_in_arn
  lambda_auth_authorizer = module.lambda.auth_authorizer_arn
  api_gateway_role      = module.iam.api_gateway_role
  vpc_link_id           = aws_api_gateway_vpc_link.vpc_link.id
  target_group_port     = var.target_group_port
  dns_name              = var.dns_name
  uriECRImage           = var.uriECRImage
}

resource "aws_api_gateway_vpc_link" "vpc_link" {
  name        = "fiap-burger-vpc-link"
  target_arns = [data.aws_lb.load_balancer.arn]
}
