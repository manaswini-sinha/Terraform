resource "aws_instance" "sandbox" {
    ami="ami-0614680123427b75e"
    instance_type = "t2.micro"
    key_name = "mop"
     for_each =  toset(var.sandboxes) 
     tags={
        Name =each.value
     }
}
variable "sandboxes" {
    type=list(string)
    default = [ "test","prod"]
}