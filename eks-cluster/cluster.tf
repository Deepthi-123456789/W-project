module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "cluster"
  ami = "ami-0b4f379183e5706b9"
  instance_type          = "t2.micro"
  # key_name               = "user1"
  # monitoring             = true
  vpc_security_group_ids = [aws_security_group.cluster.id]
  subnet_id              = "subnet-01c1c823852d19a68"
  user_data = file("workstation.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


resource "aws_security_group" "cluster" {
  name        = "cluster"
  description = "created for ekctl"
  tags = {
    Name = "cluster"
  }
  ingress {
    description = "all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}