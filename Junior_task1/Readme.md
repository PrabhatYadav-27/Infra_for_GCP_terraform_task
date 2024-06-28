### The goal is to setup new organization according to already defined blueprint  using `terraform` 

### Make an simple app to say hello world
-this is simple python app which display hello world
```
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)
```

### Then we have to make a docker image of above application
- The Dockerfile for above app is
```
FROM python:3.9-slim
WORKDIR /app
COPY . .
EXPOSE 8080
ENV NAME World
CMD ["python", "app.py"]
```
### Provider is used to connect with google cloud provider so we have create the `provider.tf` file for this to achieve
```
provider "google"{
    project = var.project_id
    region = var.region
}


```

### Backend 
`backend.tf`  file int Terraform is used to configure the backend where Terraform's state files are stored. Terraform state files contains the current state of your infrastructure and are critical for terraform to manage resources properly. In this we have setup the backent.tf file, the backend is configured to use Google Cloud Storage(GCS)

```
terraform{
    backend "gcs"{
        bucket = "BUCKET_NAME"
        prefix = "terraform/cloud-run"
        
    }
}

```

### `main.tf` this file is basically use to create the cloud run service of the given infrastructure requirements. Its accepts various inputs like
- name: name of the cloud  run service.
- location: Location/ Region where you want to deploy your serive
- image_name: Image name 
- conatianer_port: Container port on which the image will be running
- traffic %: Percentage allow on the port for direct traffic

```

resource "google_cloud_run_service" "cloud_run" {
    name     = var.service_name
    location = var.region

    template{
        spec {
          containers {
            image = local.image_url
            ports {
              container_port =  8080
            }
          }
        }
    } 


    
    traffic {
      percent = 100
      latest_revision = true
    }
  
}

```

### `iam_user.tf` this file will be used for following
This Terraform code creates an IAM service member to manage access to the Cloud Run service, specifying parameters for the service name, location, role (roles/run.invoker), and members (allUsers).

It ensures only specified users have access to the Cloud Run service by assigning the "roles/run.invoker" permission to allUsers.


### `variables.tf`  this file is used for the reusablity of code we can use them accoring to our requirements

- project_id: Allows specifying the Google Cloud project where the Cloud Run service will be created, making the Terraform configuration reusable across different projects.
- region: Specifies the region where the Cloud Run service will be deployed, providing flexibility to choose different regions based on requirements or preferences.
- service_name: Defines the name of the Cloud Run service, enabling customization and avoiding hard-coded values.
- image_tag: Specifies the tag of the container image, allowing for version control and deployment of specific image versions.
- repository_name: Names the repository where the container image is stored, supporting organization and management of container images.
- image: Specifies the full path to the container image to be deployed, facilitating the use of different images without changing the core Terraform code.

### The `output.tf ` will print the url of of our cloud run

```
    
output "name" {
    value = google_cloud_run_service.cloud_run[0].local.image_url
    description = "The URL for Cloud Run Service are displayed"
}


```

### `terraform.tfvars` this will pass on the values 
This is to define the values for our terraform variables to customize the deployments
This also sets the project_id, region, service_name, and Docker image for the Cloud Run service, allowing for easy configuration management and deployment across different environments.