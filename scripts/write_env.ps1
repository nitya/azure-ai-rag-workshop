# Define the .env file path
$envFilePath = "src\.env"

# Clear the contents of the .env file
Set-Content -Path $envFilePath -Value ""

# Append new values to the .env file
$azureAiProjectConnectionString = azd env get-value AZURE_AIPROJECT_CONNECTION_STRING
$azureAiChatDeploymentName = azd env get-value AZURE_AI_CHAT_DEPLOYMENT_NAME
$azureTenantId = azd env get-value AZURE_TENANT_ID

Add-Content -Path $envFilePath -Value "AZURE_AIPROJECT_CONNECTION_STRING=$azureAiProjectConnectionString"
Add-Content -Path $envFilePath -Value "AZURE_AI_CHAT_DEPLOYMENT_NAME=$azureAiChatDeploymentName"
Add-Content -Path $envFilePath -Value "AZURE_TENANT_ID=$azureTenantId"
