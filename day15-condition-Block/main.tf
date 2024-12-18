provider"aws"{

}
resource "aws_s3_bucket" "name" {
  bucket = "conditionbucket"
    tags = {
        name="myBucket"
    }
}
variable "create_bucket" {
    description = "set to true to create the S3 bucket."
    type = bool
    default = true
  
}
resource "random_string" "name" {
    count = var.create_bucket ? 1 : 0
    length = 7
    special = false
    upper = false

}
resource "aws_s3_bucket" "example" {
  count = var.create_bucket ? 1 : 0
  bucket = "my-bucket2${random_string.name[count.index].id}"

  tags = {
    Name        = "ConditionalBucket"
    Environment = "Dev"
  }
}