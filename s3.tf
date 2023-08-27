# https://docs.warpstream.com/warpstream/how-to/configure-the-warpstream-agent-for-production

resource "aws_s3_bucket" "warpstream_bucket" {
  bucket = "warpstream-bucket-${var.aws_region}"

  tags = {
    Name = var.default_tag
  }
}

resource "aws_s3_bucket_metric" "warpstream_bucket_metrics" {
  bucket = aws_s3_bucket.warpstream_bucket.id
  name   = "EntireBucket"
}

resource "aws_s3_bucket_lifecycle_configuration" "warpstream_bucket_lifecycle" {
  bucket = aws_s3_bucket.warpstream_bucket.id

  # Automatically cancel all multi-part uploads after 7d so we don't accumulte an infinite
  # number of partial uploads.
  rule {
    id     = "7d multi-part"
    status = "Enabled"
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }

  # No other lifecycle policy. The WarpStream agents will automatically clean up and
  # deleted expired files.
}