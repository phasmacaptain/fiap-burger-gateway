variable "target_group_port" {
  description = "The port of the target group"
  type        = number
  default     = 80
}

variable "dns_name" {
  description = "The DNS name of the load balancer"
  type        = string
  default     = "a690af0e21e134494803e9ed08048abc-1821136041.us-east-1.elb.amazonaws.com"
}

variable "uriECRImage" {
  description = "The URI of the ECR image"
  type        = string
  default     = "http://"
}
