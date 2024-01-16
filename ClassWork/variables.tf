variable "region" {
  type = string
  default = "us-east-1"
  description = "AWS Region Configuration"
}
variable "access_key" {
  type = string
  default = ""
  description = "Access Key"
}
variable "secret_key" {
  type = string
  default = ""
  description = "Secret Access Key"
}