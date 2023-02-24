# This script is used to get a list of VM images available in a specific Azure region
# Author: Danidu Weerassinghe
# Date: 2023-02-23

# Set the Azure region name to retrieve VM images
$locName="australiaEast"

# Get the list of VM image publishers in the specified region
Get-AzVMImagePublisher -Location $locName | Select-object PublisherName

# Get the VM image offers available for a specific publisher in the specified region
$pubName="MicrosoftWindowsServer"
Get-AzVMImageOffer -Location $locName -PublisherName $pubName | Select Offer

# Get the list of SKUs available for a specific VM image offer from a specific publisher in the specified region
$offerName="WindowsServer"
Get-AzVMImageSku -Location $locName -PublisherName $pubName -Offer $offerName | Select Skus

# Get the versions available for a specific VM image SKU from a specific publisher in the specified region
$skuName="2019-Datacenter"
Get-AzVMImage -Location $locName -PublisherName $pubName -Offer $offerName -Sku $skuName | Select Version
