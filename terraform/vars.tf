variable "region" {
  description = "region AWS"
  default     = "us-west-2"
}
variable "vpc_name" {
  description = "nombre VPC."
  default     = "vpc"
}

variable "vpc_cidr" {
  description = "CIDR para VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  description = "Lista de CIDR para subnets publicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets_cidr" {
  description = "Lista de CIDR para subnets privadas"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "azs" {
  description = "Zonas de disponibilidad para  las subnets."
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}
