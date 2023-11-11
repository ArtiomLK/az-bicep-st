// ------------------------------------------------------------------------------------------------
// Deployment parameters
// ------------------------------------------------------------------------------------------------
@description('Az Resources tags')
param tags object = {}
@description('Az Resource deployment location')
param location string = resourceGroup().location

// ------------------------------------------------------------------------------------------------
// Application parameters
// ------------------------------------------------------------------------------------------------
@minLength(3)
@maxLength(24)
@description('Storage Account Name. For example: storagename')
param name string

@description('Storage Account type')
@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_ZRS'
  'Standard_GZRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Premium_LRS'
  'Premium_ZRS'
])
param sku string = 'Standard_LRS'

@description('Storage Account type')
@allowed([
  'StorageV2'
  'FileStorage'
  'BlockBlobStorage'
])
param kind string = 'StorageV2'

resource stg 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: name
  location: location
  sku: {
    name: sku
  }
  kind: kind
  properties: {
    supportsHttpsTrafficOnly: true
  }
  tags: tags
}
