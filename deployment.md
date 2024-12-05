First i give my account access to azure resources:
[learn.microsoft.com][Link]

Then i give my account Owner at Tenant root group.
```
connect-AzAccount

New-AzRoleAssignment -SignInName "adminmartinf@kommuneasker.onmicrosoft.com" -RoleDefinitionName Owner -Scope "/"
```

This describes the deployment process

1. Do a what-if to check what is going to be deployed (Management group)
```
az deployment tenant create --name test --location norwayeast --template-file "infra-as-code/bicep/modules/managementGroups/managementGroups.bicep" --parameters "infra-as-code/bicep/modules/managementGroups/parameters/managementGroups.parameters.all.json" --what-if
```
2. Do the deployment (Management group)
```
az deployment tenant create --name deploy --location norwayeast --template-file "infra-as-code/bicep/modules/managementGroups/managementGroups.bicep" --parameters "infra-as-code/bicep/modules/managementGroups/parameters/managementGroups.parameters.all.json"
```

3. Do a what-if to check what is going to be deployed (Custom Policy Definitions)
```
az deployment mg create --name "Custom-Policy" --location norwayeast --management-group-id rlab --template-file "infra-as-code/bicep/modules/policy/definitions/customPolicyDefinitions.bicep" --parameters "infra-as-code/bicep/modules/policy/definitions/parameters/customPolicyDefinitions.parameters.all.json" --what-if
```

4. Do the deployment (Custom Policy Definitions)
```
az deployment mg create --name "Custom-Policy" --location norwayeast --management-group-id rlab --template-file "infra-as-code/bicep/modules/policy/definitions/customPolicyDefinitions.bicep" --parameters "infra-as-code/bicep/modules/policy/definitions/parameters/customPolicyDefinitions.parameters.all.json"
```

5. Do a what-if to check what is going to be deployed (Custom Role)
```
az deployment mg create --name "Custom-Role" --location norwayeast --management-group-id rlab --template-file "infra-as-code/bicep/modules/customRoleDefinitions/mc-customRoleDefinitions.bicep" --parameters "infra-as-code/bicep/modules/customRoleDefinitions/parameters/customRoleDefinitions.parameters.all.json" --what-if
```

6. Do the deployment (Custom Role)
```
az deployment mg create --name "Custom-Role" --location norwayeast --management-group-id rlab --template-file "infra-as-code/bicep/modules/customRoleDefinitions/mc-customRoleDefinitions.bicep" --parameters "infra-as-code/bicep/modules/customRoleDefinitions/parameters/customRoleDefinitions.parameters.all.json"
```

7. Do a what-if to check what is going to be deployed (Logging)
```
az account set --subscription d826929a-41b6-495c-b772-40c9fd1b00bf (rlab-management)

az deployment group create --name Logging --resource-group rg-rlab-logging-001 --template-file "infra-as-code/bicep/modules/logging/logging.bicep" --parameters "infra-as-code/bicep/modules/logging/parameters/logging.parameters.all.json" --what-if
```

8. Do the deployment (Logging)
```
az account set --subscription d826929a-41b6-495c-b772-40c9fd1b00bf (rlab-management)

az deployment group create --name Logging --resource-group rg-rlab-logging-001 --template-file "infra-as-code/bicep/modules/logging/logging.bicep" --parameters "infra-as-code/bicep/modules/logging/parameters/logging.parameters.all.json"
```

9. Do a what-if to check what is going to be deployed (Diagnostic)
```
az deployment mg create --template-file infra-as-code/bicep/orchestration/mgDiagSettingsAll/mgDiagSettingsAll.bicep --parameters infra-as-code/bicep/orchestration/mgDiagSettingsAll/parameters/mgDiagSettingsAll.parameters.all.json --location norwayeast --management-group-id rlab --what-if
```

10. Do the deployment (Diagnostic)
```
az deployment mg create --template-file infra-as-code/bicep/orchestration/mgDiagSettingsAll/mgDiagSettingsAll.bicep --parameters infra-as-code/bicep/orchestration/mgDiagSettingsAll/parameters/mgDiagSettingsAll.parameters.all.json --location norwayeast --management-group-id rlab
```

11. Do a what-if to check what is going to be deployed (Policy Assignments)
```
az deployment mg create --name "Policy-Assignments" --location norwayeast --management-group-id rlab --template-file "infra-as-code/bicep/modules/policy/assignments/alzDefaults/alzDefaultPolicyAssignments.bicep" --parameters "infra-as-code/bicep/modules/policy/assignments/alzDefaults/parameters/alzDefaultPolicyAssignments.parameters.all.json" --what-if
```

12. Do the deployment (Policy Assignments)
```
az deployment mg create --name "Policy-Assignments" --location norwayeast --management-group-id rlab --template-file "infra-as-code/bicep/modules/policy/assignments/alzDefaults/alzDefaultPolicyAssignments.bicep" --parameters "infra-as-code/bicep/modules/policy/assignments/alzDefaults/parameters/alzDefaultPolicyAssignments.parameters.all.json"
```




[Link]:                                 https://learn.microsoft.com/en-us/azure/role-based-access-control/elevate-access-global-admin?tabs=azure-portal "learn.microsoft.com"
