terraform {
  backend "gcs" {
    bucket      = "bucket-name"
    prefix      = "path/for/terraform.tfstate"
  }
}