terraform {
  backend "s3" {
    bucket = "aniket-project-bucket12"
    region = "eu-west-1"
    key    = "terraform.tfstate"
    #dynamodb_table = "Lock-Files"
    encrypt = true
  }
}