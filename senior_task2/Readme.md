- The root module folder is containing the core terraform files of the cloud services. Files likes  `main.tf` , `output.tf` and  `variables.tf` are present there 

-  The root module is the main directory containing Terraform configuration files that define the desired infrastructure. It includes the `main.tf`, `outputs.tf`, `terraform.tfvars`, and `variables.tf`files.
- `main.tf`: This file contains the primary infrastructure code. It defines the resources and configurations for the infrastructure you want to create.

- `output`: This file specifies the outputs of the module, which can be used by other modules or the calling module to retrieve information about the resources created.

- `terraform.tfvars`: This file contains the default values for the variables used in the module. These values can be overridden by the calling module or during terraform apply with command-line arguments.

- `variables.tf`: This file defines the variables that the module accepts. It specifies the type, description, and default values for each variable.

- The calling module is responsible for invoking the root module and passing any necessary variable values to it. It includes a configuration that references the root module as a source.

### Provider
 This file configures the Google Cloud provider, setting up necessary authentication and defining the project and region where resources will be managed.

```
provider "google" {
  project = var.project_id
  region  = var.region
}
```
### Backend
 This  specifies the use of Google Cloud Storage (GCS) as a backend for storing Terraform state files.

```
terraform {
  backend "gcs" {
    bucket = "BUCKET_NAME"
    prefix = "terraform/cloud-run"
  }
}
```


## using cloud-run module in `main.tf`
The below is the terraform calling module code. 
- Cloud Run Module  = Defines a module named `cloud_run` that sets up a Google Cloud Run service.
- VPC Module = Declares a module named `vpc` responsible for creating a Virtual Private Cloud (VPC) in Google Cloud Platform.
- Subnet Module = Configures a module named `subnet` to manage subnets within the `VPC` created by the vpc module.


`output.tf`
- The `output.tf` file aims to declare outputs that will expose important information after the Terraform configuration is applied. This includes retrieving:

- Cloud Run Service URL: This output fetches the URL of the Cloud Run service deployed using the cloud_run module.

- VPC Self-link: This output prints the self-link URL of the VPC created by the vpc module. The self-link uniquely identifies the VPC within Google Cloud Platform.

 - Subnets Self-link: This output prints the self-link URLs of the subnets created within the VPC by the subnet module. Each subnet's self-link identifies the subnet's location and attributes within the VPC.


 ### `variables.tf`
 -The  file defines input variables for configuring a Cloud Run service and its associated networking components (VPC and subnets). Here's a concise overview of each variable and its purpose:

- project_id: Specifies the Google Cloud project ID where the Cloud Run service will be deployed. It must not be empty.

- region: Defines the region in which the Cloud Run service will be hosted, defaulting to "asia-southeast1". Region must be specified and cannot be null.

- service_name: Sets the name of the Cloud Run service. It cannot be empty.

- image: Specifies the Docker container image to deploy, validated against a regex pattern ensuring it follows the format 'repository
'.

- vpc_name: Names the Virtual Private Cloud (VPC) where resources will be created. It must not be empty.

- subnets: Maps subnet configurations within the VPC, ensuring it's provided as a map with specific attributes (name and cidr_block) for each subnet.

- image_tag: Specifies the tag of the Docker container image. It must be specified and cannot be null.

- repository_name: Names the Docker repository where the container image is hosted. It must be specified and cannot be null


### The `terraform.tfvars`
- file in Terraform serves as a convenient way to define and assign values to variables used in your Terraform configuration files (variables.tf, main.tf, etc.).


### This terraform project is manages the infrastructure of GCP 

### HOW TO USE IT
### Terraform initialization

Run ` terraform init`:
-Use the `terraform init` command to initialize Terraform and set up your working directory. This command performs several key tasks:

- Downloads and installs the specified provider plugins (e.g., Google Cloud provider plugin) if they are not already installed.
- Initializes the backend (if configured) for storing Terraform state.
- Downloads any modules specified in your configuration files.

- Navigate to Your Terraform Configuration Directory:
Open your terminal or command prompt and change directory (cd) to the location of your Terraform configuration files.

### Run `terraform plan`:
Use the `terraform plan` command to generate an execution plan. This command analyzes your configuration and state to determine what actions are necessary to achieve your desired state as defined in your configuration files.
 
 ###   RUN ` terraform Validate` and Confirm:
Verify that the planned changes align with your expectations and infrastructure requirements. If needed, you can adjust your Terraform configuration files (*.tf) and repeat the terraform plan command until you are satisfied with the plan.

###  `terraform apply` Changes:
If you are satisfied with the plan and ready to apply the changes to your infrastructure, you can proceed with terraform apply. This will execute the actions specified in the plan.


### How to clean the infrastructure one done with

### Run `terraform destroy`:
Use the `terraform destroy` command to destroy the infrastructure defined in your Terraform configuration files. This will delete all resources that Terraform manages.
