resource "aws_instance" "cloud" {
  #count = 2
  ami                    = data.aws_ssm_parameter.instance_ami.value
  instance_type          = "t3.medium"
  key_name               = "wjohnson"
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "${var.default_tags.env}-EC2-cloud"
  }
  user_data = base64encode(file("./user_cloud.sh"))  # or us /Users/wesjohnson/Desktop/homebrew/q2_tf/user.sh
}

resource "aws_instance" "node" {
  ami                    = data.aws_ssm_parameter.instance_ami.value
  instance_type          = "t3.medium"
  key_name               = "wjohnson"
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "${var.default_tags.env}-EC2-node"
  }
  user_data = base64encode(file("./user_node.sh"))  # or us /Users/wesjohnson/Desktop/homebrew/q2_tf/user.sh
}

# output "ec2_ssh_command" {
#   value = "ssh -i 'wjohnson.pem' ubuntu@ec2-${replace(aws_instance.main.public_ip, ".", "-")}.compute-1.amazonaws.com"
# }
