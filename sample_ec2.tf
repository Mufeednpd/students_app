# Define provider (AWS in this case)
provider "aws" {
  region = "us-east-1"  # Specify your desired AWS region
}

# Define an EC2 instance
resource "aws_instance" "lab-01" {
  ami           = "ami-053b0d53c279acc90"  # Specify your desired AMI ID
  instance_type = "t2.micro"  # Specify your desired instance type

  # Define tags for the instance
  tags = {
    Name = "lab-01"
  }
}


