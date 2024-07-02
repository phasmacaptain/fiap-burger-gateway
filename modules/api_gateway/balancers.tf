resource "aws_security_group" "lb_sg" {
  name        = "fiap-burger-lb-sg-gtw"
  description = "Allow HTTP traffic"
  vpc_id      = "vpc-061b6881e5e910a9a"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "clients_fiap_burger_lb" {
  name               = "fiap-burger-lb-clients"
  internal           = false
  load_balancer_type = "network"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-07559b6ca5d4e7ab4", "subnet-060aa625708d1da40", "subnet-003119a8b68a3fe05"]
}

resource "aws_lb_target_group" "clients_fiap_burger_tg" {
  name     = "clients-fiap-burger-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = "vpc-061b6881e5e910a9a"
}

resource "aws_lb_listener" "clients_fiap_burger_listener" {
  load_balancer_arn = aws_lb.clients_fiap_burger_lb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.clients_fiap_burger_tg.arn
  }
}

resource "aws_lb" "pedidos_fiap_burger_lb" {
  name               = "fiap-burger-lb-pedidos"
  internal           = false
  load_balancer_type = "network"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-07559b6ca5d4e7ab4", "subnet-060aa625708d1da40", "subnet-003119a8b68a3fe05"]
}

resource "aws_lb_target_group" "pedidos_fiap_burger_tg" {
  name     = "pedidos-fiap-burger-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = "vpc-061b6881e5e910a9a"
}

resource "aws_lb_listener" "pedidos_fiap_burger_listener" {
  load_balancer_arn = aws_lb.pedidos_fiap_burger_lb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pedidos_fiap_burger_tg.arn
  }
}

resource "aws_lb" "produtos_fiap_burger_lb" {
  name               = "fiap-burger-lb-produtos"
  internal           = false
  load_balancer_type = "network"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-07559b6ca5d4e7ab4", "subnet-060aa625708d1da40", "subnet-003119a8b68a3fe05"]
}

resource "aws_lb_target_group" "produtos_fiap_burger_tg" {
  name     = "produtos-fiap-burger-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = "vpc-061b6881e5e910a9a"
}

resource "aws_lb_listener" "produtos_fiap_burger_listener" {
  load_balancer_arn = aws_lb.produtos_fiap_burger_lb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.produtos_fiap_burger_tg.arn
  }
}

resource "aws_lb" "checkout_fiap_burger_lb" {
  name               = "fiap-burger-lb-checkout"
  internal           = false
  load_balancer_type = "network"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-07559b6ca5d4e7ab4", "subnet-060aa625708d1da40", "subnet-003119a8b68a3fe05"]
}

resource "aws_lb_target_group" "checkout_fiap_burger_tg" {
  name     = "checkout-fiap-burger-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = "vpc-061b6881e5e910a9a"
}

resource "aws_lb_listener" "checkout_fiap_burger_listener" {
  load_balancer_arn = aws_lb.checkout_fiap_burger_lb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.checkout_fiap_burger_tg.arn
  }
}

resource "aws_lb" "categorias_fiap_burger_lb" {
  name               = "fiap-burger-lb-categorias"
  internal           = false
  load_balancer_type = "network"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-07559b6ca5d4e7ab4", "subnet-060aa625708d1da40", "subnet-003119a8b68a3fe05"]
}

resource "aws_lb_target_group" "categorias_fiap_burger_tg" {
  name     = "categorias-fiap-burger-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = "vpc-061b6881e5e910a9a"
}

resource "aws_lb_listener" "categorias_fiap_burger_listener" {
  load_balancer_arn = aws_lb.categorias_fiap_burger_lb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.categorias_fiap_burger_tg.arn
  }
}

resource "aws_api_gateway_vpc_link" "clients_vpc_link" {
  name        = "clients-fiap-burger-vpc-link"
  target_arns = [aws_lb.clients_fiap_burger_lb.arn]
}

resource "aws_api_gateway_vpc_link" "produtos_vpc_link" {
  name        = "produtos-fiap-burger-vpc-link"
  target_arns = [aws_lb.produtos_fiap_burger_lb.arn]
}

resource "aws_api_gateway_vpc_link" "categorias_vpc_link" {
  name        = "categorias-fiap-burger-vpc-link"
  target_arns = [aws_lb.categorias_fiap_burger_lb.arn]
}

resource "aws_api_gateway_vpc_link" "checkout_vpc_link" {
  name        = "checkout-fiap-burger-vpc-link"
  target_arns = [aws_lb.checkout_fiap_burger_lb.arn]
}

resource "aws_api_gateway_vpc_link" "pedidos_vpc_link" {
  name        = "pedidos-fiap-burger-vpc-link"
  target_arns = [aws_lb.pedidos_fiap_burger_lb.arn]
}
