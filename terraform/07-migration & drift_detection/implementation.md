## Migration


### To import existing AWS resources into Terraform

1. Write Terraform configuration for the resources you want to manage.

`main.tf`

```
provider "aws" {
    region = "ap-south-1"
}

import {
  id = "i-04cada09773b9e67a"

  to = aws_instance.example
}
```

2. Run this command
```
terraform plan -generate-config-out="generated_resources.tf"
```

Now, You notice there is file created called generated_resources.tf and all the configuration related to instance are there. then we copy all the configuration and delete the
generated_resources.tf file and create main.tf file paste the configuration.

If you see there is no state file and if you create another instance using the same configuration. it will create because there is no information of terraform resources.

3. We import the configuration using import `command`
```
terraform import aws_instance.example i-1234567890abcdef0
```
Now, you will see there is one statefile showing. 
