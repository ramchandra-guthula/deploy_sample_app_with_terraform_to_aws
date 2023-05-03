resource "aws_s3_bucket_object" "python_script" {
  bucket = aws_s3_bucket.python_script.id
  key    = "python_script.py"
  source = "python_script.py"
  etag   = filemd5("python_script.py")
}

resource "aws_s3_bucket" "python_script" {
  bucket = "python-script-interview-task"

  tags = locals.env_tags
}