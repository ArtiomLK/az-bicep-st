# Azure Storage Account (st)

[![DEV - Deploy Azure Resource](https://github.com/ArtiomLK/azure-bicep-storage-account/actions/workflows/dev.orchestrator.yml/badge.svg?branch=main&event=push)](https://github.com/ArtiomLK/azure-bicep-storage-account/actions/workflows/dev.orchestrator.yml)

## Architecting Notes

- [Types of storage accounts][4]

- [Cost Effectiveness][5]

- [Legacy storage account types][6]

  - Standard general-purpose v1
  - Standard Blob Storage

    Beginning August 1, 2022, you'll no longer be able to create new storage accounts with the classic deployment model. Resources created prior to that date will continue to be supported through August 31, 2024. For more information, see [Azure classic storage accounts will be retired on 31 August 2024][3].

## Locally test Azure Bicep Modules

```bash
# Create an Azure Resource Group
az group create \
--name 'rg-azure-bicep-storage-account' \
--location 'eastus' \
--tags project=bicephub env=dev

# Deploy Sample Modules
az deployment group create \
--resource-group 'rg-azure-bicep-storage-account' \
--mode Incremental \
--template-file examples/examples.bicep
```

## Copy Storage Containers

```bash
st_origin_n='storigin';                         echo $st_origin_n
st_destination_n='stdestingation';              echo $st_destination_n

st_container_n='conatinername';                 echo $st_container_n
sas='sas-token-example';                        echo $sas

az storage blob copy start \
--account-name MyAccount \
--destination-blob MyDestinationBlob \
--destination-container MyDestinationContainer \
--sas-token $sas \
--source-uri 'https://storage.blob.core.windows.net/photos'

st_k2_origin='nnnnn';                           echo $st_k2_origin
st_k2_destination='nnnnn';                      echo $st_k2_destination

az storage blob copy start-batch \
--account-key $st_k2_destination \
--account-name $st_destination_n \
--destination-container $st_container_n \
--source-account-key $st_k2_origin \
--source-account-name $st_origin_n \
--source-container $st_container_n
```

## Additional Info

- Azure Storage Accout
- [MS | Docs | Storage account overview][1]
- [MS | Docs | az storage blob copy][2]
- [MS | Learn |Explore Azure Blob storage][7]
  - [Explore Azure Blob storage][8]

[1]: https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview
[2]: https://docs.microsoft.com/en-us/cli/azure/storage/blob/copy
[3]: https://azure.microsoft.com/en-us/updates/classic-azure-storage-accounts-will-be-retired-on-31-august-2024/
[4]: https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview#types-of-storage-accounts
[5]: https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-block-blob-premium#cost-effectiveness
[6]: https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview#legacy-storage-account-types
[7]: https://learn.microsoft.com/en-us/training/modules/explore-azure-blob-storage
[8]: https://learn.microsoft.com/en-us/training/modules/explore-azure-blob-storage/2-blob-storage-overview
