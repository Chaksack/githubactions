provider "aws" {
    region = "us.east.2"
}

terraform {
    backend "s3" {
        bucket = ""
        key = ""
        region = ""
        encrypt = true 
        dynamodb_table = ""
    }
}