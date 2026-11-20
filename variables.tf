variable "project_name" {
  description = "AWSリソースに付けるプロジェクト名"
  type        = string
  default     = "aws-portfolio"
}

variable "environment" {
  description = "環境名"
  type        = string
  default     = "dev"
}
