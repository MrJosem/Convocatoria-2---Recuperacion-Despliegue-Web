variable "aws_region" {
  description = "Región de AWS"
  type = string
}

variable "ami_id" {
  description = "ID de la AMI usada para la instancia EC2"
  type = string
}

variable "instance_type" {
  description = "Tipo de EC2 instancia"
  type = string
}

variable "name" {
  description = "Nombre del Bucket"
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "session_token" {
  type = string
}