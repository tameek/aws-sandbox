#Bastion Security Group

resource "aws_security_group" "bastion-sg" {
  name   = "bastion-sg"
  vpc_id = aws_vpc.poc-vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.my_source_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.my_source_ip]
  }

  tags = {
    Name = "allow all to bastion server"
  }
}

#POC Security Group

resource "aws_security_group" "poc-sg" {
  name   = "tr-poc-sg"
  vpc_id = aws_vpc.poc-vpc.id

  ingress {
    # SSH Access
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.10.0/24"]
  }

  ingress {
    # Nginx on port 443
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.10.0/24"]
  }

resource "aws_security_group_rule" "allow_bastion_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion-sg.id
  security_group_id        = aws_security_group.poc-sg.id
}
