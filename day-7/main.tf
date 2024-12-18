resource "aws_instance" "test_insta"{
        ami = "ami-0aebec83a182ea7ea"
        instance_type = "t2.micro"
        key_name = "mop"

}
resource "aws_s3_bucket" "my_bucket" {
  bucket = "testbucketeeee"
}