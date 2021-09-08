# resource "aws_instance" "orchestrate" {
#   ami                         = data.aws_ami.ubuntu_2004.id
#   instance_type               = "t2.micro"
#   associate_public_ip_address = true
#   user_data                   = filebase64("cloud-init/node.yml")
#   subnet_id                   = aws_subnet.sub_pub_1.id
#   vpc_security_group_ids      = [aws_security_group.ssh_sg.id]
# }