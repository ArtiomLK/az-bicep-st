targetScope = 'resourceGroup'
// ------------------------------------------------------------------------------------------------
// Deployment parameters
// ------------------------------------------------------------------------------------------------
param location string = 'eastus'
// Sample tags parameters
var tags = {
  project: 'st'
  env: 'dev'
}

var guid_wo_dash = replace(guid(subscription().id, resourceGroup().id, tags.env), '-', '')

// ------------------------------------------------------------------------------------------------
// Storage Accounts examples
// ------------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------------
// Standard Storage Accounts
// ------------------------------------------------------------------------------------------------
module Standard_LRS '../main.bicep' = {
  name: 'Standard_LRS'
  params: {
    st_kind: 'StorageV2'
    st_n: take('${toLower(replace('Standard_LRS', '_', ''))}${guid_wo_dash}', 24)
    st_sku: 'Standard_LRS'
    location: location
    tags: tags
  }
}

module Standard_GRS '../main.bicep' = {
  name: 'Standard_GRS'
  params: {
    st_kind: 'StorageV2'
    st_n: take('${toLower(replace('Standard_GRS', '_', ''))}${guid_wo_dash}', 24)
    st_sku: 'Standard_GRS'
    location: location
    tags: tags
  }
}

module Standard_ZRS '../main.bicep' = {
  name: 'Standard_ZRS'
  params: {
    st_kind: 'StorageV2'
    st_n: take('${toLower(replace('Standard_ZRS', '_', ''))}${guid_wo_dash}', 24)
    st_sku: 'Standard_ZRS'
    location: location
    tags: tags
  }
}

module Standard_GZRS '../main.bicep' = {
  name: 'Standard_GZRS'
  params: {
    st_kind: 'StorageV2'
    st_n: take('${toLower(replace('Standard_GZRS', '_', ''))}${guid_wo_dash}', 24)
    st_sku: 'Standard_GZRS'
    location: location
    tags: tags
  }
}

module Standard_RAGRS '../main.bicep' = {
  name: 'Standard_RAGRS'
  params: {
    st_kind: 'StorageV2'
    st_n: take('${toLower(replace('Standard_RAGRS', '_', ''))}${guid_wo_dash}', 24)
    st_sku: 'Standard_RAGRS'
    location: location
    tags: tags
  }
}

module Standard_RAGZRS '../main.bicep' = {
  name: 'Standard_RAGZRS'
  params: {
    st_kind: 'StorageV2'
    st_n: take('${toLower(replace('Standard_RAGZRS', '_', ''))}${guid_wo_dash}', 24)
    st_sku: 'Standard_RAGZRS'
    location: location
    tags: tags
  }
}
// ------------------------------------------------------------------------------------------------
// Premium Storage Accounts
// ------------------------------------------------------------------------------------------------
// Page blob
// Best for random read and write operations
module Premium_LRS_page_blob '../main.bicep' = {
  name: 'Premium_LRS_page_blob'
  params: {
    st_kind: 'StorageV2'
    st_n: take('${toLower(replace('Premium_LRS_page_blob', '_', ''))}${guid_wo_dash}', 24)
    st_sku: 'Premium_LRS'
    location: location
    tags: tags
  }
}

// ------------------------------------------------------------------------------------------------
// File Shares
// Best for enterpriseor high-performance applications that need to scale
module Premium_LRS_file_share '../main.bicep' = {
  name: 'Premium_LRS_file_share'
  params: {
    st_kind: 'FileStorage'
    st_n: take('${toLower(replace('Premium_LRS_file_share', '_', ''))}${guid_wo_dash}', 24)
    st_sku: 'Premium_LRS'
    location: location
    tags: tags
  }
}

module Premium_ZRS_file_share '../main.bicep' = {
  name: 'Premium_ZRS_file_share'
  params: {
    st_kind: 'FileStorage'
    st_n: take('${toLower(replace('Premium_ZRS_file_share', '_', ''))}${guid_wo_dash}', 24)
    st_sku: 'Premium_ZRS'
    location: location
    tags: tags
  }
}

// ------------------------------------------------------------------------------------------------
// Block blobs
// Best for high transaction rates or low storage latency
module Premium_LRS_block_blob '../main.bicep' = {
  name: 'Premium_LRS_block_blob'
  params: {
    st_kind: 'BlockBlobStorage'
    st_n: take('${toLower(replace('Premium_LRS_block_blob', '_', ''))}${guid_wo_dash}', 24)
    st_sku: 'Premium_LRS'
    location: location
    tags: tags
  }
}

module Premium_ZRS_block_blob '../main.bicep' = {
  name: 'Premium_ZRS_block_blob'
  params: {
    st_kind: 'BlockBlobStorage'
    st_n: take('${toLower(replace('Premium_ZRS_block_blob', '_', ''))}${guid_wo_dash}', 24)
    st_sku: 'Premium_ZRS'
    location: location
    tags: tags
  }
}
