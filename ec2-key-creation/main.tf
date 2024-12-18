resource "aws_key_pair" "name"{
    key_name = "key_kp"
    public_key = file("c:\\Users\\Manaswini Sinha\\.ssh\\id_ed25519.pub")
}
     
  resource "aws_instance" "dev"{
     ami= "ami-0614680123427b75e"
    instance_type= "t2.micro"
    key_name= aws_key_pair.name.key_name

   tags = {
    Name="key-tf"
  }
  }