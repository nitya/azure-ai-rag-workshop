param name string
param location string = resourceGroup().location
param tags object = {}

param identityName string
param containerAppsEnvironmentName string
param containerRegistryName string
param serviceName string = 'api'
param exists bool
param projectConnectionString string
param chatDeploymentName string

resource apiIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: identityName
  location: location
}

var env = [
  {
    name: 'AZURE_CLIENT_ID'
    value: apiIdentity.properties.clientId
  }
  {
    name: 'AZURE_AIPROJECT_CONNECTION_STRING'
    value: projectConnectionString
  }
  {
    name: 'AZURE_AI_CHAT_DEPLOYMENT_NAME'
    value: chatDeploymentName
  }
  {
    name: 'RUNNING_IN_PRODUCTION'
    value: 'true'
  }
]

module app 'core/host/container-app-upsert.bicep' = {
  name: '${serviceName}-container-app-module'
  params: {
    name: name
    location: location
    tags: union(tags, { 'azd-service-name': serviceName })
    identityName: apiIdentity.name
    exists: exists
    containerAppsEnvironmentName: containerAppsEnvironmentName
    containerRegistryName: containerRegistryName
    targetPort: 50505
    env: env
  }
}

output SERVICE_API_IDENTITY_PRINCIPAL_ID string = apiIdentity.properties.principalId
output SERVICE_API_NAME string = app.outputs.name
output SERVICE_API_URI string = app.outputs.uri
output SERVICE_API_IMAGE_NAME string = app.outputs.imageName
