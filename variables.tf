variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "project_name" {
  type    = string
  default = "tf-cpu-monitor"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "cpu_threshold" {
  type    = number
  default = 70
}

variable "alert_email" {
  type        = string
  description = "Email address that receives the alarm notification"
}
