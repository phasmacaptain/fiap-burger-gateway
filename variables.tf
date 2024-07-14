variable "target_group_port" {
  description = "The port of the target group"
  type        = number
  default     = 80
}


# >>>>>>>>>>> Change if switch account <<<<<<<<<<<

variable "dns_name" {
  description = "The DNS name of the load balancer"
  type        = string
  default     = "a690af0e21e134494803e9ed08048abc-1821136041.us-east-1.elb.amazonaws.com"
}

variable "account_id" {
  description = "Account ID"
  type        = string
  default     = "643230847802"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-008220555f42a21df"
}

variable "subnet_a" {
  description = "Subnet S"
  type        = string
  default     = "subnet-02332486181d5f757"
}

variable "subnet_b" {
  description = "Subnet S"
  type        = string
  default     = "subnet-065b86e8bc1297d97"
}

variable "subnet_c" {
  description = "Subnet C"
  type        = string
  default     = "subnet-060b3fa08edb4c3f7"
}

