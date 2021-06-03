#Parameters to be used, change accordingly
$Location = "NorthEurope"
$RGName = "CloudEightRG"
$applicationInsightsName = "CloudEightAI"
$actionGroupName = "CloudEightAG"
$actionGroupShortName = "AlertCloud8"
$alertEmailReceiver = "Michael"
$alertEmailAddress = "mbj78@hotmail.com"

#Connect to Azure
Connect-AzAccount

#Select subscription
Get-AzSubscription -SubscriptionName "AzureFabric" | Select-AzSubscription

#Create the Resource Group
New-AzResourceGroup  -Name $RGName `
-Location $Location

#Create the Application insights instance
New-AzResourceGroupDeployment -ResourceGroupName $RGName `
-TemplateFile .\AppInsightsIncludingSmartAlertsAndFailureAnomaliesActionGroup.json `
-applicationInsightsName $applicationInsightsName `
-actionGroupName $actionGroupName `
-actionGroupShortName $actionGroupShortName `
-alertEmailReceiver $alertEmailReceiver `
-alertEmailAddress $alertEmailAddress -verbose