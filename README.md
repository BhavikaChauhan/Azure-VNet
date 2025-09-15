# Azure VNet with 3 Subnets and VMs (Terraform)

## Overview
This project creates:
- 1 Resource Group
- 1 Virtual Network
- 3 Subnets (Working, Authentication, Web)
- 1 VM in each subnet

All resources are deployed via Terraform.

## Architecture
[ Resource Group ]
└── [ VNet: 10.0.0.0/16 ]
├── Working Subnet (10.0.1.0/24) → VM1
├── Auth Subnet (10.0.2.0/24) → VM2
└── Web Subnet (10.0.3.0/24) → VM3

csharp
Copy code

## Usage
```sh
terraform init
terraform plan
terraform apply -auto-approve
