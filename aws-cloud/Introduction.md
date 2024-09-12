# Introduction

## Cloud computing
Cloud computing is a on-demand delivery of IT resources over the internet with pay-as-you-go model. Instead of buying, owning and maintaining physical datacenters and servers, you can access technology services such as computing power, storage, databases etc.

## Benefits of Cloud computing

`Reduce costs`

- Cloud resources both Capex and Opex.
- Organization no longer have to spend huge amount of money on physical servers, related IT infrastructure, specialized IT workforce, server rooms or datacenters.

`Pay-as-you-go`

- You will pay what you use.

`Scalability`

- Scale up
- Scale down

`Accessibility`

- Accessed from virtually anywhere and anytime.

`Business continuity`

- Any crisis do not result in data loss.

## Risk of Cloud computing
- Loss of cloud data and services
- Data security
- Compliance and legal risks
- Cost concerns

## Cloud Delivery models

- **IAAS** is the delivery of servicess, including an operating system, storage, networking and various software elements on a request basis

   e.g: AWS Ec2, Google compute engine etc

- **PAAS** is a mechanism for combining IAAS with an abstracted set of middle services, software development and deployment tools. These allow the organization to have a consistent way to create and deploy application on a cloud or on-premises environment.

  e.g: Google app engine

- **SAAS** is a business application created and hosted by a provider in a multi-tenant model.

  e.g Google workspace

## Deployment models

- **Public Cloud** :
  It is a type of computing where resources are offered by a third-party provider via internet and shared by organizations and individuals who want to use and purchase them.

- **Private Cloud** :
  It is a cloud computing environment dedicated to a single organization. Any cloud infrastructure has underlying compute resources like CPU and storage that you provision on demand through a self-service portal. All resources are isolated and in the control of one organization.

- **Hybrid Cloud** :
  Most companies use a combination of private computing resources and public services

- **Multi-cloud** :
  Some companies, in addition, also use a variety of public cloud services to support the different developer and business unit.

## Cloud Storage types

- **Block storage** : The name suggests the data is stored in the form of block. It store the data in the form of fixed-size of chunks which is called block with its own address but no metadata which provide the context for what that block of data is all about.
  e.g: Elastic block storage(EBS)

    - It cannot be accessed directly through APIs.
    - It is controlled or accessed by the external operating system.

- **Object Storage** : It is used to store the unstructural data which can be a photo, video, audio of any size. e.g : Simple storage service(s3)
- **File storage** : It is a method for storing data in the cloud that provides servers and applications access to data through shared file systems. This compatibility makes cloud file storage ideal for workloads that rely on shared file systems and provide simple integration without code changes. e.g : Elastic file system(EFS)
