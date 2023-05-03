# interview_task
Repo used to show case one of the interview task, the request is as below 

1.    Create EC2 where

    a.    Instance type should be configurable

    b.    Instance EBS volume size should be configurable

    c.     Mount the EBS volume

    d.    Upload a python program to the EC2 instance

    e.    Run the program at the instance creation

    f.      EC2 should be in private subnet

    g.     Add tags to the ec2 instance

2.    Write a Python program 

    a.    Create a file

    b.    Write the data 1 to 100 numbers in the file

3.    Create an s3 bucket

    a.    Provide list permission to the ec2 instance on the s3 bucket


# Overview on implementation
* I've used terraform cloud to deploy the resources instead of deploying local CLI to show case the benfit of using terraform cloud, but we can run locally 
by configuring AWS CLI with ACCESS KEY and SECRET KEY or on top of the EC2 instance where we have IAM role configured, this repo's is configured with GITHUB ACTIONS
in order to validate the Terraform code and validate the basic complaince

# Basic commands
```
terraform init 

terraform plan -var='instance_type=t2.micro' -var="ebs_volume_size=16"

terraform apply -var='instance_type=t2.micro' -var="ebs_volume_size=16"

```
