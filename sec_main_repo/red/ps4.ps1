This script can be used to spin up infrastructure.
The infrastructure can be customized to include the desired resources.
Import the necessary modules.
import-module azure
import-module vmware

Create a resource group.
$resourceGroup = new-azureresourcegroup -name "my-resource-group" -location "westus"

Create a virtual network.
$virtualNetwork = new-azurevnet -name "my-virtual-network" -resourcegroup $resourceGroup -location "westus" -addressprefix "10.0.0.0/16"

Create a subnet.
$subnet = new-azuresubnet -name "my-subnet" -resourcegroup $resourceGroup -vnet $virtualNetwork -addressprefix "10.0.1.0/24"

Create a virtual machine.
$virtualMachine = new-azurevm -name "my-virtual-machine" -resourcegroup $resourceGroup -vnet $virtualNetwork -subnet $subnet -imagename "microsoft.compute.image.ubuntu-server-latest" -size "Standard_B2s"

Start the virtual machine.
start-azurevm -name $virtualMachine

Wait for the virtual machine to start.
wait-for-azurevm -name $virtualMachine -ready

Configure the virtual machine.
...
Deploy an application to the virtual machine.
...
Test the application.
...
Clean up the infrastructure.
...

Here are some additional tips for spinning up infrastructure with PowerShell:
Use the New-AzureResourceGroup cmdlet to create a resource group.
Use the New-AzureVNet cmdlet to create a virtual network.
Use the New-AzureSubnet cmdlet to create a subnet.
Use the New-AzureVM cmdlet to create a virtual machine.
Use the Start-AzureVM cmdlet to start a virtual machine.
Use the Wait-For-AzureVM cmdlet to wait for a virtual machine to start.
Use the Get-AzureVM cmdlet to get information about a virtual machine.
Use the Remove-AzureVM cmdlet to remove a virtual machine.
Use the Get-AzureResourceGroup cmdlet to get information about a resource group.
Use the Remove-AzureResourceGroup cmdlet to remove a resource group.
