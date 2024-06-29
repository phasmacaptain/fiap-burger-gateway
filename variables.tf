variable "target_group_port" {
  description = "The port of the target group"
  type        = number
  default     = 80
}

variable "dns_name" {
  description = "The DNS name of the load balancer"
  type        = string
}

variable "uriECRImage" {
  description = "The URI of the ECR image"
  type        = string
}
