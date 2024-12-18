resource "aws_instance" "dev" {
  ami= "ami-0614680123427b75e"
  instance_type= "t2.micro"
  key_name = "mop"
  user_data = file("script.sh")
  tags = {
    Name="key-tf"
  }
}