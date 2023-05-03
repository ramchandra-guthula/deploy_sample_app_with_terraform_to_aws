resource "aws_iam_instance_profile" "instance_profile" {
  name = "instance_profile"
  role = aws_iam_role.s3_role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "s3_role" {
  name               = "s3_role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}


resource "aws_iam_policy" "s3_policy" {
  name        = "s3_policy"
  path        = "/"
  description = "S3 policy to download the file from S3 bucket"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObjectAcl",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutBucketVersioning"
        ]
        Effect = "Allow"
        Resource = [
          "${aws_s3_bucket.python_script.arn}",
          "${aws_s3_bucket.python_script.arn}/*"

        ]
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "olicy-attachmen" {
  name       = "policy-attachment"
  roles      = [aws_iam_role.s3_role.name]
  policy_arn = aws_iam_policy.s3_policy.arn
}