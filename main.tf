provider "aws" {
  region = "us-east-1"
  #access_key = "AKIAXT4MA42PVGTSQVPJ"
  #secret_key = "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"
  
}

locals {
  ami_id                 = "ami-0c02fb55956c7d316"
  instance_type_id       = "t2.micro"
  key_name_id            = "keypair_daz"
  monitoring_id          = true
  vpc_security_group_ids = ["sg-01802469dd8b542cc"]
  subnet_id              = "subnet-dff876ee"

}
module "ec2_instance" {

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  
  name                   = "single-instance"
  
  ami                    = local.ami_id
  instance_type          = local.instance_type_id
  key_name               = local.key_name_id
  monitoring             = local.monitoring_id
  vpc_security_group_ids = local.vpc_security_group_ids
  subnet_id              = local.subnet_id

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Single Instance DAZ"
  }
}
