# Identity And Access Management(IAM)

- It is a service provided by Amazon Web Services (AWS) that helps you manage access to your AWS resources. It's like a security system for your AWS account.
- IAM allows you to create and manage users, groups, and roles.
- With IAM, you can control and define permissions through policies. Policies are written in JSON format and specify what actions are allowed or denied on specific AWS resources. These policies can be attached to IAM entities (users, groups, or roles) to grant or restrict access to AWS services and resources.
- IAM follows the principle of least privilege, meaning users and entities are given only the necessary permissions required for their tasks, minimizing potential security risks. IAM also provides features like multi-factor authentication (MFA) for added security and an audit trail to track user activity and changes to permissions.
- By using AWS IAM, you can effectively manage and secure access to your AWS resources, ensuring that only authorized individuals have appropriate permissions and actions are logged for accountability and compliance purposes.
- Overall, IAM is an essential component of AWS security, providing granular control over access to your AWS account and resources, reducing the risk of unauthorized access and helping maintain a secure environment.

## Components of IAM 

**Users:** It represents individual people or entities (such as applications or services) that interact with your AWS resources. Each user has a unique name and security credentials (password or access keys) used for authentication and access control.

**Groups:** Groups are collections of users with similar access requirements. Instead of managing permissions for each user individually, you can assign permissions to groups, making it easier to manage access control. Users can be added or removed from groups as needed.

**Roles:** Roles are used to grant temporary access to AWS resources. Roles are typically used by applications or services that need to access AWS resources on behalf of users or other services. Roles have associated policies that define the permissions and actions allowed for the role.

**Policies:** Policies are JSON documents that define permissions. Policies specify the actions that can be performed on AWS resources and the resources to which the actions apply. Policies can be attached to users, groups, or roles to control access. IAM provides both AWS managed policies (predefined policies maintained by AWS) and customer managed policies (policies created and managed by you).

## Usecases(IAM Roles)

- Accessing EC2 Instances Across AWS Accounts
- Currently Developer in private cloud and wants to communicate to Storage service in aws cloud

### Cross-Account IAM Roles

You want to grant an EC2 instance in Account A the ability to access an S3 bucket in Account B. This can be achieved using cross-account IAM roles.

**Step1:** Create IAM Role in Account B, go to the IAM console and create a new IAM role.

**Step2:** Attach permissions: Attach the necessary permissions to the role, such as AmazonS3FullAccess or more granular permissions based on your specific requirements.

**Step3:** Trust relationship: Configure the role's trust relationship to allow users or services from Account A to assume it.

**Step4:** Obtain role ARN: Get the ARN (Amazon Resource Name) of the IAM role you created in Account B.

**Step5:** Assume role: In Account A, use the AWS CLI, SDKs, or the console to assume the role from Account B. This will provide temporary security credentials to access the S3 bucket in Account B.

**Step6** Configure EC2 Instance: Create or modify instance: Create a new EC2 instance or modify an existing one in Account A.

**Step7** IAM instance profile: Attach the IAM role you created in Account B to the EC2 instance as an IAM instance profile.

Example using AWS CLI:

In Account A:
```
Bash
aws sts assume-role --role-arn arn:aws:iam::account-b-id:role/s3-access-role --role-session-name MySessionName

# Use the temporary credentials to access the S3 bucket
aws s3 ls s3://bucket-name
```
