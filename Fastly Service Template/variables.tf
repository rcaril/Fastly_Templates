#Main Variables

variable "key" {
}
variable "domain1" {
  default = null
  type = string
}
variable "domain2" {
  default = null
  type = string
}
variable "backendAddr" {
}
variable "backendName" {
}
variable "backendPort" {
}
variable "serviceName" {
}