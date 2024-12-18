resource "aws_instance" "dev" {
  ami = "ami-0614680123427b75e"
  instance_type= "t2.micro"
  key_name ="mop"
  tags = {
    Name="key-tf"
  }
}