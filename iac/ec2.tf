provider "aws" {
  region     = var.region

}

resource "aws_instance" "ec2" {
  ami           = "ami-053b0d53c279acc90" # us-east-1a
  instance_type = "t2.micro"
  key_name = "test"
  subnet_id     = aws_subnet.subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids= [aws_security_group.myapp_sg.id]
  tags = {

    Name = "application-srv01"
  }

}


