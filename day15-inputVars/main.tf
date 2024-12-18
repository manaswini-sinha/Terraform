resource "aws_instance" "dev" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
      Name = "dev-ec3"
    }
}
variable "ami" {
    description = "ami value"
    type = string
    default = ""
}
variable "instance_type" {
    description = "intance_type"
    type = string
    default = ""
  
}
variable "key_name" {
  description = "key_name"
  type = string 
  default = ""
}
