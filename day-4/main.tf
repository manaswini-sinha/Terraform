resource "aws_instance" "name" {
  ami= "ami-0aebec83a182ea7ea"
  instance_type= "t2.micro"
  key_name="mop"
  
}