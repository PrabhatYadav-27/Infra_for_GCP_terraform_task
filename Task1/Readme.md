### The goal is to setup new organization according to already defined blueprint  using `terraform` 


### This is used to connect with google cloud provider so we have create the `provider.tf` file for this to achieve
```
provider "google"{
    project = var.project_id
    region = var.region
}


```

### 