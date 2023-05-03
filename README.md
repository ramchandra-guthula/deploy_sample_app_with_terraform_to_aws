# interview_task
This repository contains the code for an interview task that involves creating an EC2 instance, writing a Python program, and creating an S3 bucket. 

# Task Requirements
1) Create an EC2 instance with the following specifications:

* Instance type should be configurable.
* Instance EBS volume size should be configurable.
* Mount the EBS volume.
* Upload a Python program to the EC2 instance.
* Run the program at instance creation.
* EC2 should be in a private subnet.
* Add tags to the EC2 instance.
* Write a Python program with the following requirements:

2) Create a file.
* Write the data 1 to 100 numbers in the file.

3) Create an S3 bucket with the following requirements:
* Provide list permission to the EC2 instance on the S3 bucket.


# Implementation Overview
Terraform Cloud is used to deploy the resources instead of deploying locally with the CLI to showcase the benefits of using Terraform Cloud. However, the code can also be run locally by configuring AWS CLI with Access Key and Secret Key, or on top of an EC2 instance where an IAM role is configured. This repository is configured with GitHub Actions to validate the Terraform code and ensure basic compliance.

# Commands to use
```
terraform init 

terraform plan -var='instance_type=t2.micro' -var="ebs_volume_size=16"

terraform apply -var='instance_type=t2.micro' -var="ebs_volume_size=16"

```
