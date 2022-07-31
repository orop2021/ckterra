variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-052efd3df9dad4825"
}

variable "node_instance_type" {
  type    = string
  default = "t2.small"
}


variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "keypair" {
  type    = string
  default = "ansible"
}
variable "master-name" {
  type    = string
  default = "Master-K8s"
}
variable "node1-name" {
  type    = string
  default = "Node1-K8s"
}

variable "node2-name" {
  type    = string
  default = "Node2-K8s"
}

variable "env" {
  type    = string
  default = "Dev"
}

variable "ingressrule" {
  type    = list(any)
  default = ["80", "22"]
}

