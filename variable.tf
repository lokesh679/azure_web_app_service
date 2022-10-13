variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "service_plan" {
  description = "Name of service plan"
  default     = "appln"
}
variable "name" {
  description = "Name of the web app service"
  default     = "cloud-app"
}

