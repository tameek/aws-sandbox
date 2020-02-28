resource "aws_instance" "poc-aml" {
  ami             = var.poc_ami_image
  instance_type   = var.poc_instance_type
  count           = var.poc_instance_count
  subnet_id       = aws_subnet.poc-private-subnet.id
  key_name        = var.ssh_key
  security_groups = [aws_security_group.poc-sg.id]

  root_block_device {
    delete_on_termination = "true"
    volume_size           = var.root_disk_size
  }

  ebs_block_device {
    device_name = var.data_disk_name
    volume_size = var.root_disk_size
    volume_type = "standard"
  }

  tags = {
    Name = "poc-aml.${count.index}"
  }
}
