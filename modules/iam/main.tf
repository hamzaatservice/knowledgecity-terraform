resource "aws_iam_role" "ec2_role" {
  name               = "knowledgecity_ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Effect = "Allow"
      Sid    = ""
    }]
  })
}

resource "aws_iam_policy" "ec2_policy" {
  name   = "knowledgecity_ec2_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "logs:*"
      Effect = "Allow"
      Resource = "*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}
