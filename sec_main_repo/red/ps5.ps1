# This script patches a system with the latest security updates.

# Import the PowerShell Security module.
Import-Module Security

# Set the target system's IP address.
$ip = "192.168.1.1"

# Patch the target system with the latest security updates.
Patch-System -IP $ip

# Write a message to the user.
Write-Host "The system has been patched with the latest security updates."



# This script automates a variety of tasks.

# Import the PowerShell modules that will be used.
Import-Module Security
Import-Module ActiveDirectory
Import-Module Microsoft.PowerShell.Utility

# Set the variables that will be used.
$domain = "contoso.com"
$username = "administrator"
$password = Read-Host -Prompt "Enter the password for the administrator account: " -AsSecureString

# Connect to the domain controller.
$cred = New-Object -typename System.Management.Automation.PSCredential -argumentlist $username, $password
Connect-ADDomain -Credential $cred

# Get the list of all users in the domain.
$users = Get-ADUser -Filter * -Properties Name, Department, Title, Location

# Sort the list of users by department.
$users = Sort-Object $users -Property Department

# Write the list of users to a CSV file.
Export-Csv -Path "C:\Users.csv" -InputObject $users

# Get the list of all computers in the domain.
$computers = Get-ADComputer -Filter * -Properties Name, OperatingSystem, Location

# Sort the list of computers by location.
$computers = Sort-Object $computers -Property Location

# Write the list of computers to a CSV file.
Export-Csv -Path "C:\Computers.csv" -InputObject $computers

# Get the list of all open ports on all computers in the domain.
$ports = Get-NetTCPConnection -State Listen -ComputerName $computers

# Sort the list of ports by computer name.
$ports = Sort-Object $ports -Property ComputerName

# Write the list of ports to a CSV file.
Export-Csv -Path "C:\Ports.csv" -InputObject $ports

# Disconnect from the domain controller.
Disconnect-ADDomain

# Write a message to the user.
Write-Host "The script has completed successfully."



# This script performs a variety of security-related tasks.

# Import the PowerShell modules that will be used.
Import-Module Security
Import-Module ActiveDirectory
Import-Module Microsoft.PowerShell.Utility

# Set the variables that will be used.
$domain = "contoso.com"
$username = "administrator"
$password = Read-Host -Prompt "Enter the password for the administrator account: " -AsSecureString

# Connect to the domain controller.
$cred = New-Object -typename System.Management.Automation.PSCredential -argumentlist $username, $password
Connect-ADDomain -Credential $cred

# Get the list of all users in the domain who have a weak password.
$weakPasswordUsers = Get-ADUser -Filter * -Properties Name, PasswordLastSet, Password -ErrorAction SilentlyContinue | Where-Object {
  $_.PasswordLastSet -lt (Get-Date).AddDays(-90) -and $_.Password -like "*[a-zA-Z]{3,10}[0-9]{2,4}[a-zA-Z]{3,10}"
}

# Send an email notification to the security team with a list of the weak password users.
$subject = "Weak Password Users"
$body = "The following users have weak passwords:

" + $weakPasswordUsers | Out-String -Width 500
Send-MailMessage -To security@contoso.com -Subject $subject -Body $body

# Change the passwords of all weak password users.
ForEach ($user in $weakPasswordUsers) {
  $newPassword = Read-Host -Prompt "Enter a new password for $user: " -AsSecureString
  Set-ADUser $user -Password $newPassword
}

# Disconnect from the domain controller.
Disconnect-ADDomain

# Write a message to the user.
Write-Host "The script has completed successfully."