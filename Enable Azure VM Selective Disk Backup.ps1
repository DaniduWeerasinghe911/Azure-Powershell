# Author: Danidu Weerasinghe
# Date: [Date]
# Description: Enable selective disk backup for an Azure VM

# Connect to Azure
Connect-AzAccount

# Get the disks in the resource group
Get-AzDisk -ResourceGroupName "ResourceGroupName"

# Get the VM
$vm = Get-AzVM -ResourceGroupName "ResourceGroupName" -Name "Servername"

# Display the data disks for the VM
$vm.StorageProfile.DataDisks

# Specify the LUN number to backup
$disks = "1"

# Set the target recovery services vault
$targetVault = Get-AzRecoveryServicesVault -ResourceGroupName "ResourceGroupName Recovery Service Vault" -Name "RecoveryServiceVaultName"

# Set the recovery services vault context
Set-AzRecoveryServicesVaultContext -Vault $targetVault

# Get the backup policy
$pol = Get-AzRecoveryServicesBackupProtectionPolicy -Name "DEV12AM7D"

# Enable backup for the specified disks
Enable-AzRecoveryServicesBackupProtection -Policy $pol -Name "ServerName" -ResourceGroupName "ResourceGroup" -InclusionDisksList $disks -VaultId $targetVault.ID

# Get the backup item
$item = Get-AzRecoveryServicesBackupItem -BackupManagementType "AzureVM" -WorkloadType "AzureVM" -VaultId $targetVault.ID -FriendlyName "LinuxVm01"
