# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0
# Fiap Pos tech

terraform {
   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.21.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}


provider "aws" {
    profile = "fiap-burguer"
    region = "us-east-1"
}

locals {
  cluster_name = "prod"
}