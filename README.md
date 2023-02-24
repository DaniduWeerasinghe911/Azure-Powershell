Azure PowerShell Scripts
This repository contains a collection of PowerShell scripts for working with Azure services.

Prerequisites
To use these scripts, you will need to have the following installed:

PowerShell 7 or later
Azure PowerShell module
Scripts
create-resource-group.ps1
This script creates a new resource group in Azure. It requires the following parameters:

ResourceGroupName: The name of the new resource group.
Location: The location of the new resource group.
deploy-arm-template.ps1
This script deploys an Azure Resource Manager template to a resource group. It requires the following parameters:

ResourceGroupName: The name of the resource group to deploy the template to.
TemplateFile: The path to the ARM template file.
ParameterFile: The path to the parameters file for the ARM template.
create-virtual-network.ps1
This script creates a new virtual network in Azure. It requires the following parameters:

ResourceGroupName: The name of the resource group to create the virtual network in.
VirtualNetworkName: The name of the new virtual network.
AddressPrefix: The address prefix for the new virtual network.
SubnetName: The name of the new subnet within the virtual network.
SubnetAddressPrefix: The address prefix for the new subnet.
Usage
To use these scripts, clone this repository to your local machine and open PowerShell 7 or later. Navigate to the directory where the scripts are located and run them using the .\script-name.ps1 syntax. Be sure to pass in the required parameters for each script.

For more information on using Azure PowerShell, see the official documentation.
