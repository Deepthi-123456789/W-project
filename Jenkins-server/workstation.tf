module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "jenkins-server"
  ami = "ami-0b4f379183e5706b9"
  instance_type          = "t2.medium"
  user_data = file("requires.sh")
  monitoring             = true
  

  tags = {
    Name = "jenkins-server"
    Terraform   = "true"
    Environment = "dev"
  }
}
