variable "instance_name" {
  type        = string
  description = "Name for the instance"
}

variable "instance_type" {
  type        = string
  description = "Type for the instance"
  default     = "t2.micro"
}

variable "region" {
  type        = string
  description = "Region for the instance"
  default     = "ap-southeast-2"
}