resource "aws_s3_bucket" "private_storage" {
  bucket = "craft-private-storage"
  acl    = "private"
}

resource "aws_s3_bucket_object" "registry" {
  bucket = "${aws_s3_bucket.private_storage.bucket}"
  key    = "auth-for-container-registry"
  source = "./auth-for-container-registry"
  acl    = "private"
}

resource "aws_s3_bucket" "public_storage" {
  bucket = "craft-public-storage"
  acl    = "public-read"
}
