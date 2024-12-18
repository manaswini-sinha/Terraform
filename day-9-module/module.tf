
module "apple" {
  source        = "../day-2"
  ami           = "ami-0614680123427b75e"
  instance_type = "t2.micro"
  key_name      = "mop"
}