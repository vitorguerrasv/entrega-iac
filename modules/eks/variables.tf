variable "cluster_name" {
  description = "Nome do cluster EKS."
  type        = string
}

variable "subnet_ids" {
  description = "Subnets usadas pelo control plane e pelos nodes."
  type        = list(string)
}

variable "eks_version" {
  description = "Versao do Kubernetes do EKS."
  type        = string
  default     = "1.32"
}

variable "node_instance_type" {
  description = "Tipo de instancia dos nodes."
  type        = string
  default     = "t3.small"
}

variable "desired_size" {
  description = "Quantidade desejada de nodes."
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Quantidade minima de nodes."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Quantidade maxima de nodes."
  type        = number
  default     = 3
}
