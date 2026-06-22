provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-04a64102b8022e4f3"
  instance_type          = "c7i-flex.large"
  key_name               = "rahamdocker"
  vpc_security_group_ids = ["sg-0bcdfca25bea871a3"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
