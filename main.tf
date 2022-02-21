// Provider specific configs
# provider "aws" {
#     access_key = "${var.aws_access_key}"
#     secret_key = "${var.aws_secret_key}"
#     region = "${var.aws_region}"
# }


// EC2 Instance Resource for Module
resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    vpc_security_group_ids = "${var.vpc_security_group_ids}"
    
    tags = {
    Name = "${var.instance_name}-${count.index+1}"
    Terraform   = "true"
    Environment = "dev"
  }
}
