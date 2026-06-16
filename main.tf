provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-03f1d2b3639314198"
  instance_type          = "c7i-flex.large"
  key_name               = "rahamdocker"
  vpc_security_group_ids = ["sg-0f9c92c1376b173cf"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
