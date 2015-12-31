{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjets",
      "Effect": "Allow",
      "Principal": "*",
      "Action": ["s3:GetObject"],
      "Resource": "arn:aws:s3:::${backet}/*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": [
            "${web_public_ip}"
          ]
        }
      }
    }
  ]
}
