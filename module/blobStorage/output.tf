output "accountStorageUrl" {
  description = "Public Url of the Storage Account"
  value       = azurerm_storage_account.webStorage.primary_web_endpoint
}