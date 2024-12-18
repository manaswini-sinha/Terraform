#count
resource "aws_instance" "myec2" {
   ami = "ami-0614680123427b75e"
     instance_type = "t2.micro"
     key_name = "mop"
     #count = 3
     count = length(var.sandboxes)
     tags = {
          # Name = "webec2"
           #Name = "webec2-${count.index}"
           Name=var.sandboxes[count.index]
           }
}
variable "sandboxes" {
    type=list(string)
    default = [ "web","dev" ]
  
}