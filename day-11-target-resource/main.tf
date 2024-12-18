resource "aws_instance" "dependent" {
    ami = "ami-0aebec83a182ea7ea"
    instance_type = "t2.micro"
    key_name = "public"
}

resource "aws_s3_bucket" "dependent" {
    bucket = "pokmnbgt" 
}

