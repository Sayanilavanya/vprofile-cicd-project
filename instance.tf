data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  availability_zone      = var.zone
  tags = {
    Name = "Website"
  }
  provisioner "file" {
    source      = "provisioning.sh"
    destination = "/tmp/provisioning.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provisioning.sh",
      "sudo /tmp/provisioning.sh"
    ]

  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(pathexpand("~/.ssh/id_ed25519"))
    host        = self.public_ip
  }
}

