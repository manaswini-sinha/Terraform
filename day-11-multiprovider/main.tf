resource "aws_s3_bucket" "test" {
  bucket = "ytre"

}
resource "aws_s3_bucket" "test2" {
  bucket = "nbvvc"
  provider = aws.provider2  #provider.value of alias
  
}