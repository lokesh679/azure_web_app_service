output "az_app_service_plan_id" {
  description = "ID of the newly created app service plan"
  value       = azurerm_app_service_plan.appln.id
}
