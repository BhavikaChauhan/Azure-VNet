# Automating Azure Infrastructure with Terraform: VNets, Subnets, and Virtual Machines

This repository contains Terraform configurations to provision networking and compute resources on **Microsoft Azure**.
The setup includes:

* A Resource Group
* A Virtual Network (VNet)
* Multiple Subnets
* A Network Security Group (NSG) with inbound rules for SSH and internal communication
* Linux Virtual Machines inside each subnet

The goal is to demonstrate **infrastructure as code (IaC)** for automating Azure deployments while ensuring modularity, security, and scalability.

---

## 🚀 Project Overview

By applying these Terraform scripts, you will:

1. Build an Azure Virtual Network with subnets.
2. Secure communication using a Network Security Group (NSG).
3. Launch multiple Linux Virtual Machines in different subnets.
4. Test VM-to-VM communication via private IPs.

This forms the foundation for production-ready environments such as **load balancers, Kubernetes clusters, and CI/CD pipelines**.

---

## 📂 Repository Structure

```
Azure-VNet/
 ├─ modules/
 │   ├─ resource_group/
 │   │   └─ main.tf
 |   |   └─ variables.tf 
 │   ├─ network/
 │   │   └─ main.tf
 |   |   └─ variables.tf
 │   └─ vm/
 │       └─ main.tf
 |   |   └─ variables.tf
 ├─ main.tf
 ├─ variables.tf
 ├─ providers.tf 
 ├─ outputs.tf
 └─ terraform.tfvars
```

---

## ⚙️ Prerequisites

* [Terraform](https://developer.hashicorp.com/terraform/downloads) ≥ 1.6
* [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed & authenticated (`az login`)
* Active Azure Subscription

---

## 🚀 Usage

### 1. Clone this repository

```bash
git clone https://github.com/BhavikaChauhan/Azure-VNet.git
cd Azure-VNet
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Validate configuration

```bash
terraform validate
```

### 4. Preview the execution plan

```bash
terraform plan
```

### 5. Apply and provision resources

```bash
terraform apply -auto-approve
```

### 6. Verify connectivity

* Use SSH to connect to your VMs.
* Test **private IP communication** using `ping` between VMs.

---

## 🛠️ Debugging Common Issues

* **Ping fails?** → Ensure NSG allows `VirtualNetwork` traffic
* **SSH blocked?** → Confirm NSG inbound rule for port `22` exists
* **No IP assigned?** → Check subnet associations in Terraform
* **OS firewall active?** → Disable `ufw` or allow ICMP traffic

---

## 📌 Best Practices

* Always run `terraform plan` before `apply`
* Use `terraform.tfvars` for environment-specific values
* Store state in a **remote backend** (Azure Storage) when collaborating
* Use **modules** for reusable infrastructure patterns

---

## 📖 Detailed Tutorial

👉 For a complete step-by-step guide with explanations, check out my blog:
**[Automating Azure Infrastructure with Terraform: VNets, Subnets, and Virtual Machines](https://medium.com/@bhavika.engineered/automating-azure-infrastructure-with-terraform-vnets-subnets-and-virtual-machines-83b299b2b44b**

---

## 🔗 Connect

* LinkedIn: [Bhavika Chauhan](https://www.linkedin.com/in/bhavika-chauhan-276b41332)
* GitHub: [BhavikaChauhan](https://github.com/BhavikaChauhan)

