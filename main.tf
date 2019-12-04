provider "aws" {
  profile = "${var.aws_profile}"
}


#-----IAM Resources------




resource "aws_iam_instance_profile" "khaled-profile" {
  name = "khaled-profile"
  role = "${aws_iam_role.khaled-role.name}"
}



resource "aws_iam_role" "khaled-role" {
  name = "khaled-role"
  assume_role_policy = <<EOF
{

	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "sts:AssumeRole",
			"Principal": {
				"Service": "ec2.amazonaws.com"
				},
			"Effect": "Allow",
			"Sid": ""
		}
	]
}
EOF
}

#Role_Policy

resource "aws_iam_role_policy" "S3-access" {
  name = "S3-full-access"
  role = "${aws_iam_role.khaled-role.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "S3:access",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

