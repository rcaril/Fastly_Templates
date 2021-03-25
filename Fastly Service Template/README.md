# Fastly Service Templates

This is currently a work in progress. The goal of this project is to create ready to deploy Terraform templates for the Fastly platform. 

Fastly Terraform General Notes:
When applying changes to a service with Terraform, a new version of your service will be created, rather than the expected behavior of Terraform destroying your infrastructure as is commonm with other Providers. 