<#

.SYNOPSIS
	Horizon View Disabled pools Check (CheckMK Check)

.DESCRIPTION
	This script can be used with Check MK Agent to allow Check MK to monitor Horizon View.

.EXAMPLE
	.\check_horizonview_disabled_pools.ps1 -SetPasswordFilePassword
	
	Save a password to a encrypted/hashed file (can be used later with the -PasswordFilePath switch)

.EXAMPLE
	.\check_horizonview_disabled_pools.ps1 -ConnectionServer horizonview.example.com -UserName monitor -Domain example.com -Password secret1
	
	Connect to Horizon View using a password

.EXAMPLE
	.\check_horizonview_disabled_pools.ps1 -ConnectionServer horizonview.example.com -UserName monitor -Domain example.com -PasswordFilePath c:\password.txt
	
	Connect to Horizon View using a password file

.NOTES
	Name:        Horizon View Disabled Pools Check (Chack MK Agent Check)
	Version:     1.0
	Author:      Thomas Chubb, Marcel debray
	URL:		 https://github.com/mccrossen/checkmk_horizonview
	Date:        20/03/2019

#>

param (
	[string]$ConnectionServer = 'horizonview.example.com',
	[string]$UserName = 'monitoring',
	[string]$UserDomain = 'example.com',
	[string]$PasswordFilePath = 'C:\Pass.txt',
	[string]$Password = $null,
	[switch]$SetPasswordFilePassword = $false
)

# Clear host
Clear-Host

# Run password file set wizard if the switch is used
if ($SetPasswordFilePassword) {
	Write-Host "Password file setup wizard (if the password file exists it will be overwritten)`n"
	$EnteredPasswordFilePath = Read-Host -Prompt 'Enter the path to the password file you wish to create/overwrite'
	$EnteredPassword = Read-Host -AsSecureString -Promp 'Enter the password to be saved in the password file (copy and paste is not supported)'
	try {
		$EnteredPassword | ConvertFrom-SecureString -ErrorAction Stop | Out-File $EnteredPasswordFilePath -Force -ErrorAction Stop
	} catch {
		Write-Host "`nError writing password file"
		Exit
	}
	Write-Host "`nPassword file saved ($EnteredPasswordFilePath)"
	Exit
}

# Load required modules
try {
	Import-Module VMware.VimAutomation.HorizonView -ErrorAction Stop
	Import-Module VMware.VimAutomation.Core -ErrorAction Stop
} catch {
	# UNKNOWN
	Write-Host '3 HVDisabledPools - UNKNOWN: Error loading the horizon view modules'
	Exit 3
}

# Set credentials
if ($Password) {$PasswordType = 'password argument'} else {$PasswordType = 'password file argument'}
try {
	if ($Password) {
		# Use the plain text password argument
		$SecPassword = $Password | ConvertTo-SecureString -AsPlainText -Force
		$Credentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $UserName,$SecPassword
		} else {
		# Use password the file if a plain text password argument is not provided
		$Password = Get-Content $PasswordFilePath -ErrorAction Stop
		$Credentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $UserName,($Password | ConvertTo-SecureString -ErrorAction Stop) -ErrorAction Stop
	}
} catch {
	# UNKNOWN
	Write-Host "3 HVDisabledPools - UNKNOWN: Error loading credentials using the $PasswordType"
	Exit 3
}

# Connect to horizon
try {
	Connect-HVServer -Server $ConnectionServer -Domain $UserDomain -Credential $Credentials -ErrorAction Stop | Out-Null
} catch {
	# UNKNOWN
	Write-Host "3 HVDisabledPools - UNKNOWN: Error connecting to $ConnectionServer"
	Exit 3
}

# Get pool information
$PoolSummary = Get-HVPoolSummary | Select -Expand DesktopSummaryData | Select Name,DisplayName,Enabled,ProvisioningEnabled
$DisabledPools = $PoolSummary | where {$_.Enabled -ne 'False' -or $_.ProvisioningEnabled -ne 'False'}

# Return nagios result
if ($DisabledPools) {
	# CRITICAL
	$DisabledPoolsString = ''
	$DisabledPools | foreach {$DisabledPoolsString += $_.Name + ','}
	$DisabledPoolsString = $DisabledPoolsString.TrimEnd(',')
	Write-Host "2 HVDisabledPools - CRITICAL:- Disabled pools: $DisabledPoolsString"
	Exit 2
} else {
	# OK
	Write-Host "0 HVDisabledPools - OK: All pools are enabled"
	Exit 0
}