provider "aws" {
#  profile = "${var.aws_profile}"
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}


#-----IAM Resources------




resource "aws_iam_instance_profile" "khaled-profile" {
  name = "khaled-profile-tf"
  role = "${aws_iam_role.khaled-role.name}"
}



resource "aws_iam_role" "khaled-role" {
  name = "khaled-role-tf"
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
  name = "S3-full-access-tf"
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

