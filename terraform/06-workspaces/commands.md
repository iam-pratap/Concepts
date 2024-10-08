### To create a new and empty workapace
```
terraform workspaces new <workspace-name>
```

**Note** New folder(workspace) is created under `terraform.tfstate.d` and seperate statefile for each workspace.

### To switch to new workspace
```
terraform workspace select <workspace-name>
```
### To see the currrent workspace
```
terraform workspace show
```
