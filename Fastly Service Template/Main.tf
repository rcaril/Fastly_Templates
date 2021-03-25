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
  name = var.serviceName

  domain {
    name    = var.domain1
    comment = "api test"
  }

  backend {
    address = var.backendAddr
    name    = var.backendName
    port    = var.backendPort
  }

  force_destroy = false

    vcl {
    name    = "my_custom_main_vcl"
    content = "#Sample VCL"
    main    = true
  }
}

