variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

variable "vpc" {
  description = "VPC ID"
  type        = string
  default     = "vpc-12345678909876543"
}

variable "ami" {
  description = "AMI ID"
  type        = string
  default     = "ami-12345678909876543"
}

variable "itype" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet" {
  description = "Subnet ID"
  type        = string
  default     = "subnet-12345678909876543"
}

variable "publicip" {
  description = "Whether to assign public IP address"
  type        = bool
  default     = true
}

variable "keyname" {
  description = "SSH key name"
  type        = string
  default     = "wtfkey"
}

variable "secgroupname" {
  description = "Security group name"
  type        = string
  default     = "SecurityGroup1"
}

variable "private_key_path" {
  description = "Path to the private key file"
  type        = string
  default     = "/your/aws/key_pair/location/key.pem"
}

variable "zone_id" {
  description = "Route53 Zone ID"
  type        = string
  default     = "ASDFGHJKLZXCVBNMQWERT"
}

variable "domain_name" {
  description = "Domain name"
  type        = string
  default     = "yourdomainname.xyz"
}
