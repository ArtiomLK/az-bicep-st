# Azure Storage Account (st)

[![DEV - Deploy Azure Resource](https://github.com/ArtiomLK/azure-bicep-storage-account/actions/workflows/dev.orchestrator.yml/badge.svg?branch=main&event=push)](https://github.com/ArtiomLK/azure-bicep-storage-account/actions/workflows/dev.orchestrator.yml)

## Architecting Notes

- [Redundancy][11]

  - Data in an Azure Storage account is always replicated three times in the primary region.

  - When you create a storage account, you select the primary region for the account. The paired secondary region is determined based on the primary region, and can't be changed.

  - **Locally redundant storage** (LRS): Copies your data synchronously three times within a single physical location in the primary region.

  - **Zone-redundant storage** (ZRS): Copies your data synchronously across three Azure availability zones in the primary region.

  - **Geo-redundant storage** (GRS) copies your data synchronously three times within a single physical location in the primary region using LRS. It then copies your data asynchronously to a single physical location in the secondary region. Within the secondary region, your data is copied synchronously three times using LRS.

  - **Geo-zone-redundant storage** (GZRS) copies your data synchronously across three Azure availability zones in the primary region using ZRS. It then copies your data asynchronously to a single physical location in the secondary region. Within the secondary region, your data is copied synchronously three times using LRS.

- [Types of storage accounts][4]

- [Blobs (azure Storage supports three types of blobs)][9]

  - **Block blobs** store text and binary data, up to about 190.7 TB. Block blobs are made up of blocks of data that can be managed individually.

  - **Append blobs** are made up of blocks like block blobs, but are optimized for append operations. Append blobs are ideal for scenarios such as logging data from virtual machines.

  - **Page blobs** store random access files up to 8 TB in size. Page blobs store virtual hard drive (VHD) files and serve as disks for Azure virtual machines.

- [Cost Effectiveness][5]

  - Premium block blob storage accounts have a higher storage cost but a lower transaction cost as compared to standard general-purpose v2 accounts. If your applications and workloads execute a large number of transactions, premium blob blob storage can be cost-effective, especially if the workload is write-heavy.

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

- Azure Storage Account
- [MS | Docs | Storage account overview][1]
- [MS | Docs | az storage blob copy][2]
- [MS | Learn |Explore Azure Blob storage][7]
  - [Explore Azure Blob storage][8]
  - [Explore Azure Storage security features][10]
  - [Evaluate Azure Storage redundancy options][11]

[1]: https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview
[2]: https://docs.microsoft.com/en-us/cli/azure/storage/blob/copy
[3]: https://azure.microsoft.com/en-us/updates/classic-azure-storage-accounts-will-be-retired-on-31-august-2024/
[4]: https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview#types-of-storage-accounts
[5]: https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-block-blob-premium#cost-effectiveness
[6]: https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview#legacy-storage-account-types
[7]: https://learn.microsoft.com/en-us/training/modules/explore-azure-blob-storage
[8]: https://learn.microsoft.com/en-us/training/modules/explore-azure-blob-storage/2-blob-storage-overview
[9]: https://learn.microsoft.com/en-us/training/modules/explore-azure-blob-storage/3-blob-storage-resources
[10]: https://learn.microsoft.com/en-us/training/modules/explore-azure-blob-storage/4-blob-storage-security
[11]: https://learn.microsoft.com/en-us/training/modules/explore-azure-blob-storage/5-azure-storage-redundancy
