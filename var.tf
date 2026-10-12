variable "region" {
  default = "us-east-1"
}
variable "zone" {
  default = "us-east-1a"
}
variable "ami_id" {
  type = map(any)
  default = {
    us-east-1 = "ami-0c02fb55956c7d316"
    us-east-2 = "ami-0a887e401f7654935"
  }
}