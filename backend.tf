terraform {
  backend "s3" {
    bucket       = "aws-portfolio-tfstate-986293907284"
    key          = "terraform.tfstate"
    region       = "ap-southeast-2"
    profile      = "portfolio"
    use_lockfile = true
  }
}
