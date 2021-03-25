# Configure the Fastly Provider
terraform {
  required_providers {
    fastly = {
      source = "fastly/fastly"
      version = "0.27.0"
    }
  }
}

provider "fastly" {
  api_key = var.key
}

# Create a Service
resource "fastly_service_v1" "myservice" {
  name = "API_Service"

  domain {
    name    = var.domain1
    comment = "api test"
  }

  backend {
    address = "ec2-3-214-228-20.compute-1.amazonaws.com"
    name    = "AWS Instance"
    port    = 80
  }

  force_destroy = false

    vcl {
    name    = "my_custom_main_vcl"
    content = "#Sample VCL"
    main    = true
  }
}

