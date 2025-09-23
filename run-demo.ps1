# -------------------------------
# Azure + Terraform Demo Script
# -------------------------------

Write-Host "🔐 Logging into Azure..."
az login

Write-Host "📌 Setting Azure subscription..."
az account set --subscription "d5f8b801-72f5-4ccb-82fe-6445526d56b8"

Write-Host "🌍 Exporting environment variables for Terraform..."
$env:ARM_SUBSCRIPTION_ID="d5f8b801-72f5-4ccb-82fe-6445526d56b8"
$env:ARM_TENANT_ID="f29931a6-5b38-46ba-9af9-068761144c96"
$env:TF_VAR_admin_username="bhavikauser"
$env:TF_VAR_admin_password="BhavikaP@ssword2025"

Write-Host "✅ Environment setup complete."

# -------------------------------
# Terraform Workflow
# -------------------------------

Write-Host "📂 Initializing Terraform..."
terraform init

Write-Host "🔎 Validating Terraform..."
terraform validate

Write-Host "📝 Planning deployment..."
terraform plan

Write-Host "🚀 Applying deployment..."
terraform apply -auto-approve

Write-Host "✅ Infrastructure deployed successfully!"

# -------------------------------
# Demo instructions (optional)
# -------------------------------

Write-Host ""
Write-Host "➡️  Use Azure Portal to view Resource Group, VNet, Subnets, NSGs, and VMs."
Write-Host "➡️  Use VM Public IP to SSH into VM1."
Write-Host "➡️  Inside VM1, ping VM2 using its Private IP (10.x.x.x)."
Write-Host ""
Write-Host "🎉 Demo ready!"
