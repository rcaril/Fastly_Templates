# Configure the Fastly Provider
provider "fastly" {
  api_key = var.key
}

# Create a Service
resource "fastly_service_v1" "myservice" {
  name = "API_Service"

  domain {
    name    = "rcproject.com"
    comment = "api test"
  }

  backend {
    address = "ec2-3-214-228-20.compute-1.amazonaws.com"
    name    = "AWS Instance"
    port    = 80
  }

  force_destroy = false
}

