resource "aws_lb" "clients_fiap_burger_lb" {
  name               = "fiap-burger-lb-clients"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = aws_subnet.public.*.id
}

resource "aws_lb_target_group" "clients_fiap_burger_tg" {
  name     = "fiap-burger-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "clients_fiap_burger_listener" {
  load_balancer_arn = aws_lb.clients_fiap_burger_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.clients_fiap_burger_tg.arn
  }
}

resource "aws_lb" "pedidos_fiap_burger_lb" {
  name               = "fiap-burger-lb-pedidos"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = aws_subnet.public.*.id
}

resource "aws_lb_target_group" "pedidos_fiap_burger_tg" {
  name     = "fiap-burger-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "pedidos_fiap_burger_listener" {
  load_balancer_arn = aws_lb.pedidos_fiap_burger_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pedidos_fiap_burger_tg.arn
  }
}

resource "aws_lb" "produtos_fiap_burger_lb" {
  name               = "fiap-burger-lb-produtos"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = aws_subnet.public.*.id
}

resource "aws_lb_target_group" "produtos_fiap_burger_tg" {
  name     = "fiap-burger-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "produtos_fiap_burger_listener" {
  load_balancer_arn = aws_lb.produtos_fiap_burger_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.produtos_fiap_burger_tg.arn
  }
}

resource "aws_lb" "checkout_fiap_burger_lb" {
  name               = "fiap-burger-lb-checkout"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = aws_subnet.public.*.id
}

resource "aws_lb_target_group" "checkout_fiap_burger_tg" {
  name     = "fiap-burger-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "checkout_fiap_burger_listener" {
  load_balancer_arn = aws_lb.checkout_fiap_burger_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.checkout_fiap_burger_tg.arn
  }
}

resource "aws_lb" "categorias_fiap_burger_lb" {
  name               = "fiap-burger-lb-categorias"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = aws_subnet.public.*.id
}

resource "aws_lb_target_group" "categorias_fiap_burger_tg" {
  name     = "fiap-burger-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_listener" "categorias_fiap_burger_listener" {
  load_balancer_arn = aws_lb.categorias_fiap_burger_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.categorias_fiap_burger_tg.arn
  }
}

resource "aws_api_gateway_vpc_link" "vpc_link" {
  name        = "fiap-burger-vpc-link"
  target_arns = [
    aws_lb.clients_fiap_burger_lb.arn,
    aws_lb.pedidos_fiap_burger_lb.arn,
    aws_lb.categorias_fiap_burger_lb.arn,
    aws_lb.checkout_fiap_burger_lb.arn,
    aws_lb.produtos_fiap_burger_lb.arn
  ]
}