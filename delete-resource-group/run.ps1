# Input bindings are passed in via param block.
param($Timer)

# Get the current universal time in the default string format
$currentUTCtime = (Get-Date).ToUniversalTime()

# The 'IsPastDue' porperty is 'true' when the current function invocation is later than scheduled.
if ($Timer.IsPastDue) {
    Write-Host "PowerShell timer is running late!"
}

# Write an information log with the current time.

Write-Host "The grim reaper arises to find those for whom death tolls ☠️"

$toll = @()

$toll += Get-AzResourceGroup | Where-Object ResourceGroupName -like 'deleteme*'

$toll += Get-AzResourceGroup | Where-Object ResourceGroupName -like 'demo-*'

Foreach ($resourceGroup in $toll) {

    Write-Host "Goodbye $($resourceGroup.ResourceGroupName) 🔔..."

    Remove-AzResourceGroup -Name $resourceGroup.ResourceGroupName -Force -AsJob

    Write-Host "⚰️"

}



Write-Host "🌙 The reaper returns to his resting until death tolls again..."
