@minLength(1)
@description('Primary location for all resources')
param location string

@description('The AI Hub resource name.')
param hubName string
@description('The AI Project resource name.')
param projectName string
@description('The Key Vault resource name.')
param keyVaultName string
@description('The Storage Account resource name.')
param storageAccountName string
@description('The AI Services resource name.')
param aiServicesName string
@description('The AI Services connection name.')
param aiServicesConnectionName string
@description('The AI Services model deployments.')
param aiServiceModelDeployments array = []
@description('The AI Services content safety connection name.')
param aiServicesContentSafetyConnectionName string
@description('The Log Analytics resource name.')
param logAnalyticsName string = ''
@description('The Application Insights resource name.')
param applicationInsightsName string = ''
@description('The Container Registry resource name.')
param containerRegistryName string = ''
@description('The Azure Search resource name.')
param searchServiceName string = ''
@description('The Azure Search connection name.')
param searchConnectionName string = ''
param tags object = {}

module hubDependencies '../ai/hub-dependencies.bicep' = {
  name: 'hubDependencies'
  params: {
    location: location
    tags: tags
    keyVaultName: keyVaultName
    storageAccountName: storageAccountName
    containerRegistryName: containerRegistryName
    applicationInsightsName: applicationInsightsName
    logAnalyticsName: logAnalyticsName
    aiServicesName: aiServicesName
    aiServiceModelDeployments: aiServiceModelDeployments
    searchServiceName: searchServiceName
  }
}

module hub '../ai/hub.bicep' = {
  name: 'hub'
  params: {
    location: location
    tags: tags
    name: hubName
    displayName: hubName
    keyVaultId: hubDependencies.outputs.keyVaultId
    storageAccountId: hubDependencies.outputs.storageAccountId
    containerRegistryId: hubDependencies.outputs.containerRegistryId
    applicationInsightsId: hubDependencies.outputs.applicationInsightsId
    aiServicesName: hubDependencies.outputs.aiServicesName
    aiServicesConnectionName: aiServicesConnectionName
    aiServicesContentSafetyConnectionName: aiServicesContentSafetyConnectionName
    aiSearchName: hubDependencies.outputs.searchServiceName
    aiSearchConnectionName: searchConnectionName
  }
}

module project '../ai/project.bicep' = {
  name: 'project'
  params: {
    location: location
    tags: tags
    name: projectName
    displayName: projectName
    hubName: hub.outputs.name
    keyVaultName: hubDependencies.outputs.keyVaultName
  }
}

// Outputs
// Resource Group
output resourceGroupName string = resourceGroup().name

// Hub
output hubName string = hub.outputs.name
output hubPrincipalId string = hub.outputs.principalId

// Project
output projectName string = project.outputs.name
output projectPrincipalId string = project.outputs.principalId

// Key Vault
output keyVaultName string = hubDependencies.outputs.keyVaultName
output keyVaultEndpoint string = hubDependencies.outputs.keyVaultEndpoint

// Application Insights
output applicationInsightsName string = hubDependencies.outputs.applicationInsightsName
output logAnalyticsWorkspaceName string = hubDependencies.outputs.logAnalyticsWorkspaceName

// Container Registry
output containerRegistryName string = hubDependencies.outputs.containerRegistryName
output containerRegistryEndpoint string = hubDependencies.outputs.containerRegistryEndpoint

// Storage Account
output storageAccountName string = hubDependencies.outputs.storageAccountName

// AI Services
output aiServicesName string = hubDependencies.outputs.aiServicesName
output aiServiceEndpoint string = hubDependencies.outputs.aiServiceEndpoint

// Search
output searchServiceName string = hubDependencies.outputs.searchServiceName
output searchServiceEndpoint string = hubDependencies.outputs.searchServiceEndpoint

//Discoveryurl
output discoveryUrl string = project.outputs.discoveryUrl
