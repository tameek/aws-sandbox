#This Terraform Script creates the bastion host used to connect to the poc, and serves as a proxy for the Ansible Playbooks

resource "aws_instance" "poc-bastion" {
  instance_type               = var.bastion_instance_type
  ami                         = var.bastion_ami
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.poc-public-subnet.id
  availability_zone           = var.df_az
  security_groups             = [aws_security_group.bastion-sg.id]
  key_name                    = var.ssh_key

  root_block_device {
    delete_on_termination = "true"
    volume_size           = var.bastion_root_volume_size
  }

  tags = {
    Name = "poc"
  }
}
