resource "aws_security_group" "lb_sg" {
  name        = "fiap-burger-lb-sg-gtw"
  description = "Allow HTTP traffic"
  vpc_id      = "vpc-008220555f42a21df"

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
  subnets            = ["subnet-02332486181d5f757", "subnet-065b86e8bc1297d97", "subnet-060b3fa08edb4c3f7"]
}

resource "aws_lb_target_group" "clients_fiap_burger_tg" {
  name     = "clients-fiap-burger-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = "vpc-008220555f42a21df"
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
  subnets            = ["subnet-02332486181d5f757", "subnet-065b86e8bc1297d97", "subnet-060b3fa08edb4c3f7"]
}

resource "aws_lb_target_group" "pedidos_fiap_burger_tg" {
  name     = "pedidos-fiap-burger-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = "vpc-008220555f42a21df"
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
  subnets            = ["subnet-02332486181d5f757", "subnet-065b86e8bc1297d97", "subnet-060b3fa08edb4c3f7"]
}

resource "aws_lb_target_group" "produtos_fiap_burger_tg" {
  name     = "produtos-fiap-burger-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = "vpc-008220555f42a21df"
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

resource "aws_api_gateway_vpc_link" "clients_vpc_link" {
  name        = "clients-fiap-burger-vpc-link"
  target_arns = [aws_lb.clients_fiap_burger_lb.arn]
}

resource "aws_api_gateway_vpc_link" "produtos_vpc_link" {
  name        = "produtos-fiap-burger-vpc-link"
  target_arns = [aws_lb.produtos_fiap_burger_lb.arn]
}

resource "aws_api_gateway_vpc_link" "pedidos_vpc_link" {
  name        = "pedidos-fiap-burger-vpc-link"
  target_arns = [aws_lb.pedidos_fiap_burger_lb.arn]
}
