variable instance_type {
  type        = string
  default     = "t2.micro"
  description = "Instance type used to create the instance"
}

variable ebs_volume_size {
  type        = string
  default     = "8"
  description = "EBS volume size to your instance"
}

locals {
    env_tags = {
        name = "interview_test"
        env  = "candidate_infra"
    }
}

variable "vpc_name" {
  type        = string
  description = "Tag name to your VPC"
  default     = "interview-test-vpc"
}

variable "ip_ranges" {
  type = list(object({
    vpc_range            = string
    public_subnet_range  = string
    private_subnet_range = string
  }))
  default = [
    {
      vpc_range            = "10.0.0.0/16"
      public_subnet_range  = "10.0.2.0/24"
      private_subnet_range = "10.0.3.0/24"
    }
  ]
}
variable account_id {
  type        = string
  default     = "522486290510"
  description = "Account ID number"
}
