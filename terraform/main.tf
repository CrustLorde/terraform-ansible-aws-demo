# Read the public key file to create a key pair in AWS
resource "tls_private_key" "generated" {
  # optional — we will not generate a key by default; we rely on public_key_path
  algorithm = "RSA"
  rsa_bits  = 4096
  count     = 0
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "demo_sg" {
  name        = "tf-demo-sg"
  description = "Allow SSH, HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "tf-demo-sg"
  }
}

resource "aws_instance" "demo" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [aws_security_group.demo_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "Flask-Terraform-Demo"
  }

  provisioner "local-exec" {
    command = "echo 'Instance ${self.public_ip} created'"
  }
}
