# Configure the Fastly Provider
terraform {
  required_providers {
    fastly = {
      source = "fastly/fastly"
      version = "0.28.2"
    }
  }
}

provider "fastly" {
  api_key = var.key
}

# Create a Service
resource "fastly_service_v1" "tfService" {
  name = var.serviceName
  domain {
    name    = var.domain1
    comment = "Primary Domain"
  }
  backend {
    address = var.backendAddr
    name    = var.backendName
    port    = var.backendPort
  }
  force_destroy = true
  vcl {
    name    = "my_custom_main_vcl"
    content = "#Sample VCL"
    main    = true
  }
  condition {
    name      = "WAF_Prefetch"
    type      = "PREFETCH"
    statement = "req.backend.is_origin"
    }
    # This condition will always be false
    # adding it to the response object created below
    # prevents Fastly from returning a 403 on all of your traffic.
    condition {
      name      = "WAF_always_false"
      statement = "false"
      type      = "REQUEST"
    }
    response_object {
      name              = "WAF_Response"
      status            = "403"
      response          = "Forbidden"
      content_type      = "text/html"
      content           = "<html><body>Forbidden</body></html>"
      request_condition = "WAF_always_false"
    }
    waf {
      prefetch_condition = "WAF_Prefetch"
      response_object    = "WAF_Response"
    }
}