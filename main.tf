terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "4.56.0"
      }
    }
    backend "s3" {
    bucket = "bucket-armazemtf"
    key    = "challenge3.tfstate"
    region = "us-east-1"
  }

}

provider "aws" {
    region = "us-east-1"
}

module "mold1" {
    source = "./mold"
    dbname = "Data Base Server"
    webname = "Web Services Server"
    ec2type2 = "ami-08a0d1e16fc3f61ea"
    typeinstance = "t2.micro"

}

output "Web_Server_Private_IP" {
    value = module.mold1.PrivateIP
    
}

output "Data_Base_Public_IP" {
    value = module.mold1.PublicIP
}