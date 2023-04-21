Port Scanner
This script will scan a range of ports for open ports.

# Port Scanner

# Import the .Net Framework
import-module .NetFramework

# Get the range of ports to scan
$ports = 1-1000

# Create a new object to store the results
$results = @()

# Loop through the range of ports
foreach ($port in $ports) {

    # Check if the port is open
    if (Test-NetConnection -ComputerName localhost -Port $port -Count 1 -Quiet) {

        # Add the port to the results object
        $results += $port
    }
}

# Print the results
Write-Host "The following ports are open:"
foreach ($port in $results) {
    Write-Host $port
}
Credential Scanner
This script will scan a file for common passwords.

Credential Scanner
Import the .Net Framework
import-module .NetFramework

Get the path to the file to scan
$file = "passwords.txt"

Create a new object to store the results
$results = @()

Open the file
$file = Get-Content $file

Loop through the lines in the file
foreach ($line in $file) {

# Check if the line is a password
if ([System.Text.RegularExpressions.Regex]::IsMatch(<span class="math-inline">line, "\(?\=^\.\{8,\}</span>)(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#<span class="math-inline">%^&\*\(\)\_\+\]\)\.\*</span>")) {

    # Add the password to the results object
    $results += $line
}
}

Print the results
Write-Host "The following passwords were found in the file:"
foreach ($result in $results) {
Write-Host $result
}

Privilege Escalation Script
This script will attempt to escalate privileges on a system.

# Privilege Escalation Script

# Import the .Net Framework
import-module .NetFramework

# Get the current user
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()

# Get the list of groups that the current user is a member of
$groups = $currentUser.Groups

# Loop through the groups
foreach ($group in $groups) {

    # Check if the group has administrative privileges
    if ($group.IsAdmin) {

        # Elevate privileges
        Write-Host "Elevating privileges..."
        Start-Process -Verb RunAs -FilePath powershell.exe
    }
}

Credential Dumping Script
This script will dump credentials from a system.

# Credential Dumping Script

# Import the .Net Framework
import-module .NetFramework

# Get the list of processes
$processes = Get-Process

# Loop through the processes
foreach ($process in $processes) {

    # Check if the process is a credential provider
    if ($process.Name -Match "Credential Provider") {

        # Dump the credentials
        Write-Host "Dumping credentials from $process.Name..."
        $process.Get-Credential()
    }
}
Lateral Movement Script
This script will attempt to move laterally to another system on the network.

Lateral Movement Script
Import the .Net Framework
import-module .NetFramework

Get the list of systems on the network
$systems = Get-NetTCPConnection | Where-Object {$_.State -EQ "Listen"} | Select-Object -ExpandProperty RemoteAddress

Loop through the systems
foreach ($system in $systems) {

# Check if the system is accessible
if (Test-NetConnection -ComputerName $system -Count 1 -Quiet) {

    # Attempt to move laterally
    Write-Host "Attempting to move laterally to $system..."
    Start-Process -Verb RunAs -FilePath powershell.exe -ArgumentList "-computername $system"
}
}

Directory Enumeration: This script enumerates the contents of a directory.
# Directory enumeration

# Get the path to the directory
$dir = "C:\Windows"

# List the contents of the directory
Get-ChildItem $dir
File search: This script searches for a file on a system.
# File search

# Get the name of the file to search for
$file = "WindowsUpdate.log"

# Search for the file on the system
Get-ChildItem -Path * -Filter $file
Process list: This script lists all the processes running on a system.
# Process list

# Get a list of all the processes
Get-Process
Registry enumeration: This script enumerates the contents of the registry.
# Registry enumeration

# Get the path to the registry key
$key = "HKEY_LOCAL_MACHINE\SOFTWARE"

# Enumerate the contents of the registry key
Get-ItemProperty $key