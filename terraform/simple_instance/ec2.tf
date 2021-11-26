provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "6e90c22feaf6f02b3e3b6ff686c4534ae70d8e1a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-26 08:54:23"
    git_last_modified_by = "67447382+leeguoqing@users.noreply.github.com"
    git_modifiers        = "67447382+leeguoqing"
    git_org              = "leeguoqing"
    git_repo             = "terragoat"
    yor_trace            = "84c2587e-1410-4c66-9135-31d5b9fe6afa"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "6e90c22feaf6f02b3e3b6ff686c4534ae70d8e1a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-26 08:54:23"
    git_last_modified_by = "67447382+leeguoqing@users.noreply.github.com"
    git_modifiers        = "67447382+leeguoqing"
    git_org              = "leeguoqing"
    git_repo             = "terragoat"
    yor_trace            = "f98e61c6-f1bc-4ddb-a4af-4719def9607a"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
