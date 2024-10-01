# Overview of steps

Create a directory for your Terraform project and create a Terraform configuration files `provider.tf` & `main.tf` in that directory. In these files, you define the AWS provider in provider.tf file and resources in main.tf file you want to create. Here's a basic example:

```hcl
   provider "aws" {
     region = "ap-south-1"  # Set your desired AWS region
   }
```
```hcl
   resource "aws_instance" "first-infra" {
  ami                     = "ami-06f855639265b5541" # Set an appropriate AMI ID
  instance_type           = "t2.micro"
  
  tags = {
    Name = "test-infra" # Set the tag to identify
  }
}
```

## Initialize Terraform**

In your terminal, navigate to the directory containing your Terraform configuration files and run:

```
terraform init
```

This command initializes the Terraform working directory, downloading any necessary provider plugins.

## Apply the Configuration

Run the following command to create the AWS resources defined in your Terraform configuration:

```
terraform apply
```

Terraform will display a plan of the changes it's going to make. Review the plan and type "yes" when prompted to apply it.

## Verify Resources

After Terraform completes the provisioning process, you can verify the resources created in the AWS Management Console or by using AWS CLI commands.

## Destroy Resources

If you want to remove the resources created by Terraform, you can use the following command:

```
terraform destroy
```

Be cautious when using `terraform destroy` as it will delete resources as specified in your Terraform configuration.
