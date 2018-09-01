# IBM Cloud Object Storage
IBM Cloud Object Storage is a highly scalable cloud storage service, designed for high durability, resiliency and security. Store, manage and access your data via our self-service portal and RESTful APIs. Connect applications directly to Cloud Object Storage use other IBM Cloud Services with your data.

Requires that you assign a resource group (default or one you create) to assign the
 - Service name:
 - Select a resource group: default

 IBM Cloud Object Storage is available with three types of resiliency: Cross Region, Regional, and Single Data Center. Cross Region provides higher durability and availability than using a single region at the cost of slightly higher latency, and is available today in the US and EU. Regional service reverses those tradeoffs, and distributes objects across multiple availability zones within a single region, and is available in the US South and US East regions. If a given region or availability zone is unavailable, the object store continues to function without impediment. Single Data Center distributes objects across multiple machines within the same physical location.

 Developers use an IBM Cloud Object Storage API to interact with their object storage. This documentation provides support to get started with provisioning accounts, to create buckets, to upload objects, and to use a reference of common API interactions.



## References
[Service](https://console.bluemix.net/catalog/services/cloud-object-storage)
[Documentation](https://console.bluemix.net/docs/services/cloud-object-storage/about-cos.html#about-ibm-cloud-object-storage)

## Features

### Plans - Lite (Free) or Pay As You Go
- 1 COS Service Instance
- Storage up to 25 GB/mo.
- Up to 20,000 GET requests/mo.
- Up to 2,000 PUT requests/mo.
- Up to Data Retrieval 10 GB/mo.
- Up to 5GB Public Outbound
- Applies to aggregate total across all storage bucket classes

### Storage for the IBM Cloud
IBM Cloud Object Storage provides unstructured data storage for cloud applications. Libraries and SDKs support a common set of S3 API functions for connecting new applications to scalable cloud storage and integrating your data into other services on the IBM Watson and Cloud Platform.

### IAM Policies - Bucket level access management
IBM Identity and Access Management (IAM) integration allows for granular access control at the bucket level using role-based policies.

### Encryption management
All data is encrypted at-rest and in-flight by default. Keys are automatically managed by default, but can optionally be self-managed or managed using IBM Key Protect*. (Key Protect is only available for buckets created in the US South (Dallas) and EU GB (London) regions.)

### Regional and Cross Region resiliency options
Select the best resiliency option for your data. Choose "Cross Region" to store unstructured data across three regions, or choose "Regional" resiliency to store your data within a single region.
Data storage classes for Active, Less Active, Archive and Dynamic workloads
Choose storage classes for frequently accessed data, occasionally accessed data and long-term data retention with Standard, Vault, and Cold Vault. Or, choose Flex class for dynamic data access needs that fluctuate month to month.
Lite and pay-as-you-go plans
