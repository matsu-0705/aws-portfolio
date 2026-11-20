data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web" {
  count = 2

  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  user_data     = <<-EOF
  #!/bin/bash
  dnf install -y nginx
  systemctl enable nginx
  systemctl start nginx
  echo "<h1>My AWS Portfolio</h1>" > /usr/share/nginx/html/index.html
EOF

  subnet_id = count.index == 0 ? aws_subnet.public_a.id : aws_subnet.public_b.id

  vpc_security_group_ids = [aws_security_group.ec2.id]

  tags = {
    Name = "portfolio-web-${count.index + 1}"
  }
}