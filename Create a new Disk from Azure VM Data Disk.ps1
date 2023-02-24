# Author: [Author Name]
# Date: [Date]
# Description: This script copies an OS disk to a new managed disk.

# Set the resource group and disk names.
$resourceGroup = ""
$DiskName = ""
$NewDiskName = ""

# Set the subscription name.
$SubName = ""

# Connect to the Azure account.
Connect-AzAccount

# Get source OS disk information.
Write-Verbose "Get the source OS Disk information: $($VM.StorageProfile.OsDisk.Name)"
$sourceOSDisk = Get-AzDisk -ResourceGroupName $resourceGroup -DiskName $DiskName

# Create the managed disk configuration.
Write-Verbose "Create the managed disk configuration..."
$diskConfig = New-AzDiskConfig -SkuName $sourceOSDisk.Sku.Name -Location $sourceOSDisk.Location -DiskSizeGB $sourceOSDisk.DiskSizeGB -SourceResourceId $sourceOSDisk.Id -CreateOption Copy

# Create the new disk.
Write-Verbose "Create the new OS disk..."
$newOSDisk = New-AzDisk -Disk $diskConfig -DiskName $NewDiskName -ResourceGroupName $resourceGroup
