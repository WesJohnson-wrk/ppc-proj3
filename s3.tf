# # s3 bucket
# resource "aws_s3_bucket" "backend" {
#   bucket = "wpj-tf-0001"
# }

# # version s3 bucket
# resource "aws_s3_bucket_versioning" "backend" {
#   bucket = aws_s3_bucket.backend.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# #s3 bucket resource policy
# data "aws_iam_policy_document" "backend" {
#   statement {
#     sid = "LetEveryoneView"
#     principals {
#       type        = "AWS"
#       identifiers = ["*"]
#     }
#     actions = [
#       "s3:*"
#     ]
#     resources = [
#       aws_s3_bucket.backend.arn, "${aws_s3_bucket.backend.arn}/*"
#     ]
#   }

# }

# # attach a policy
# resource "aws_s3_bucket_policy" "backend" {
#   bucket = aws_s3_bucket.backend.id
#   policy = data.aws_iam_policy_document.backend.json
# }