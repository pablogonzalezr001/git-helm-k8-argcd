# IMPORTANTE: Descomenta este bloque y ajusta los valores una vez que hayas 
# creado un bucket S3 y una tabla de DynamoDB manualmente para guardar el estado.

/*
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-unique-name"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-locks"
  }
}
*/
