<#
SUMMARY: This PowerShell script helps with the authoring of the policy definiton module by outputting information required for the variables within the module.
DESCRIPTION: This PowerShell script outputs the Name & Path to a Bicep strucutred .txt file named '_policyDefinitionsBicepInput.txt' and '_policySetDefinitionsBicepInput.txt' respectively. It also creates a parameters file for each of the policy set definitions. It also outputs the number of policies definition and set definition files to the console for easier reviewing as part of the PR process.
AUTHOR/S: jtracey93
VERSION: 1.3.1
#>

# Policy Definitions

Write-Information "====> Creating/Emptying '_policyDefinitionsBicepInput.txt'" -InformationAction Continue
Set-Content -Path "./infra-as-code/bicep/modules/policy/lib/policy_definitions/_policyDefinitionsBicepInput.txt" -Value $null -Encoding "utf8"

Write-Information "====> Looping Through Policy Definitions:" -InformationAction Continue
Get-ChildItem -Recurse -Path "./infra-as-code/bicep/modules/policy/lib/policy_definitions" -Filter "*.json" | ForEach-Object {
    $policyDef = Get-Content $_.FullName | ConvertFrom-Json -Depth 100
    
    $policyDefinitionName = $policyDef.name
    $fileName = $_.Name

    Write-Information "==> Adding '$policyDefinitionName' to '$PWD/_policyDefinitionsBicepInput.txt'" -InformationAction Continue
    Add-Content -Path "./infra-as-code/bicep/modules/policy/lib/policy_definitions/_policyDefinitionsBicepInput.txt" -Encoding "utf8" -Value "{`r`n  name: '$policyDefinitionName'`r`n  libDefinition: json(loadTextContent('lib/policy_definitions/$fileName'))`r`n}"
}

$policyDefCount = Get-ChildItem -Recurse -Path "./infra-as-code/bicep/modules/policy/lib/policy_definitions" -Filter "*.json" | Measure-Object 
$policyDefCountString = $policyDefCount.Count
Write-Information "====> Policy Definitions Total: $policyDefCountString" -InformationAction Continue

# Policy Set Definitions

Write-Information "====> Creating/Emptying '_policySetDefinitionsBicepInput.txt'" -InformationAction Continue
Set-Content -Path "./infra-as-code/bicep/modules/policy/lib/policy_set_definitions/_policySetDefinitionsBicepInput.txt" -Value $null -Encoding "utf8"

Write-Information "====> Looping Through Policy Set/Initiative Definition:" -InformationAction Continue

Get-ChildItem -Recurse -Path "./infra-as-code/bicep/modules/policy/lib/policy_set_definitions" -Filter "*.json" -Exclude "*.parameters.json" | ForEach-Object {
    $policyDef = Get-Content $_.FullName | ConvertFrom-Json -Depth 100

    # Load child Policy Set/Initiative Definitions
    $policyDefinitions = $policyDef.properties.policyDefinitions | Sort-Object -Property policyDefinitionReferenceId
    
    $policyDefinitionName = $policyDef.name
    $fileName = $_.Name

    # Construct file name for Policy Set/Initiative Definitions parameters files
    $parametersFileName = $fileName.Substring(0, $fileName.Length - 5) + ".parameters.json"

    # Create Policy Set/Initiative Definitions parameter file
    Write-Information "==> Creating/Emptying '$parametersFileName'" -InformationAction Continue
    Set-Content -Path "./infra-as-code/bicep/modules/policy/lib/policy_set_definitions/$parametersFileName" -Value $null -Encoding "utf8"

    # Loop through all Policy Set/Initiative Definitions Child Definitions and create parameters file for each of them
    $definitionParametersOutputJSONObject = @{}
    $policyDefinitions | Sort-Object | ForEach-Object {
        $definitionReferenceId = $_.policyDefinitionReferenceId
        $definitionParameters = $_.parameters
    
        $definitionParameters | Sort-Object | ForEach-Object {
            $definitionParametersOutputArray = @{}    
            $definitionParametersOutputArray.Add("parameters", $_)
        }
    
        $definitionParametersOutputJSONObject.Add("$definitionReferenceId", $definitionParametersOutputArray)
    }
    Write-Information "==> Adding parameters to '$parametersFileName'" -InformationAction Continue
    Add-Content -Path "./infra-as-code/bicep/modules/policy/lib/policy_set_definitions/$parametersFileName" -Value ($definitionParametersOutputJSONObject | ConvertTo-Json -Depth 10) -Encoding "utf8"
    
    # Check if variable exists before trying to clear it
    if ($policySetDefinitionsOutputForBicep) {
        Clear-Variable -Name policySetDefinitionsOutputForBicep -ErrorAction Continue 
    }

    # Create HashTable variable
    [System.Collections.Hashtable]$policySetDefinitionsOutputForBicep = [ordered]@{}

    # Loop through child Policy Set/Initiative Definitions if HashTable not == 0
    if (($policyDefinitions.Count) -ne 0) {
        $policyDefinitions | Sort-Object | ForEach-Object {
            $policySetDefinitionsOutputForBicep.Add($_.policyDefinitionReferenceId, $_.policyDefinitionId) 
        }
    }

    # Start output file creation of Policy Set/Initiative Definitions for Bicep
    Write-Information "==> Adding '$policyDefinitionName' to '$PWD/_policySetDefinitionsBicepInput.txt'" -InformationAction Continue
    Add-Content -Path "./infra-as-code/bicep/modules/policy/lib/policy_set_definitions/_policySetDefinitionsBicepInput.txt" -Encoding "utf8" -Value "{`r`n  name: '$policyDefinitionName'`r`n  libDefinition: json(loadTextContent('lib/policy_set_definitions/$fileName'))`r`n  libSetChildDefinitions: ["

    # Loop through child Policy Set/Initiative Definitions for Bicep output if HashTable not == 0
    if (($policySetDefinitionsOutputForBicep.Count) -ne 0) {
        $policySetDefinitionsOutputForBicep.Keys | Sort-Object | ForEach-Object {
            $definitionReferenceId = $_
            $definitionID = $($policySetDefinitionsOutputForBicep[$_])
            # Add nested array of objects to each Policy Set/Initiative Definition in the Bicep variable
            Add-Content -Path "./infra-as-code/bicep/modules/policy/lib/policy_set_definitions/_policySetDefinitionsBicepInput.txt" -Encoding "utf8" -Value "      {`r`n        definitionReferenceId: '$definitionReferenceId'`r`n        definitionID: '$definitionID'`r`n        definitionParameters: json(loadTextContent('lib/policy_set_definitions/$parametersFileName')).definitionReferenceId.parameters`r`n      }"
        }
    }

    # Finish output file creation of Policy Set/Initiative Definitions for Bicep
    Add-Content -Path "./infra-as-code/bicep/modules/policy/lib/policy_set_definitions/_policySetDefinitionsBicepInput.txt" -Encoding "utf8" -Value "     ]`r`n  }"

}

$policyDefCount = Get-ChildItem -Recurse -Path "./infra-as-code/bicep/modules/policy/lib/policy_set_definitions" -Filter "*.json" | Measure-Object
$policyDefCountString = $policyDefCount.Count
Write-Information "====> Policy Set/Initiative Definitions Total: $policyDefCountString" -InformationAction Continue