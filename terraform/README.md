# Before beginning

Before planning, you must create `secrets.tfvars` in this folder, that will be hidden for security reasons.
Template :

```HCL
SSH_KEY     = <Your public key here>
```

To run a new plan, if your secret file are nammed `secrets.tfvars` :

```Bash
terraform plan -var-file="secrets.tfvars"
```

To àpply a new plan, if your secret file are nammed `secrets.tfvars` :

```Bash
terraform apply -var-file="secrets.tfvars"
```
