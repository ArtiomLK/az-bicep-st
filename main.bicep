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
param st_n string

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
param st_sku string

@description('Storage Account type')
@allowed([
  'StorageV2'
  'FileStorage'
  'BlockBlobStorage'
])
param st_kind string

resource stg 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: st_n
  location: location
  sku: {
    name: st_sku
  }
  kind: st_kind
  properties: {
    supportsHttpsTrafficOnly: true
  }
  tags: tags
}
