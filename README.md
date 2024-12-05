# Azure Landing Zones (ALZ) - Bicep - Asker Kommune

[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/azure/alz-bicep.svg)](http://isitmaintained.com/project/azure/alz-bicep "Average time to resolve an issue")
[![Percentage of issues still open](http://isitmaintained.com/badge/open/azure/alz-bicep.svg)](http://isitmaintained.com/project/azure/alz-bicep "Percentage of issues still open")
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/Azure/ALZ-Bicep/badge)](https://scorecard.dev/viewer/?uri=github.com/Azure/ALZ-Bicep)

[![Update Policy Library](https://github.com/Azure/ALZ-Bicep/actions/workflows/update-policy.yml/badge.svg?branch=main)](https://github.com/Azure/ALZ-Bicep/actions/workflows/update-policy.yml)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/Azure/ALZ-Bicep?style=flat&logo=github)

![Bicep Logo](docs/wiki/media/bicep-logo.png)

Welcome to the Azure Landing Zones Bicep repo for Asker Kommune.

We have deployed everything exept **networking as it was not needed.**

- Deployment steps can be found here - [Deployment][Deployment]

Detailed information about how to use, deploy and extend artifacts found in this repo can be found on our Wiki:

- [Home][wiki_home]
- [Deployment Flow][wiki_deployment_flow]
  - [Network Topology: Hub and Spoke][wiki_deployment_flow_hs]
  - [Network Topology: Virtual WAN][wiki_deployment_flow_vwan]
- [Consumer Guide][wiki_consumer_guide]
  - [Accelerator][wiki_accelerator]
  - [Azure Montior Baseline Alerts][wiki_amba]
  - [Known Issues][wiki_known_issues]
  - [Frequently Asked Questions][wiki_faq]
- [How Does ALZ-Bicep Implement Azure Policies?][wiki_policy_deep_dive]
  - [Adding Custom Azure Policy Definitions][wiki_policy_defs]
  - [Assigning Azure Policies][wiki_policy_assignments]
- [How Does ALZ-Bicep Implement Resilient Deployments Across Availability Zones?][wiki_resiliency]
- [Contributing][wiki_contributing]
- [Telemetry Tracking Using Customer Usage Attribution (PID)][wiki_cuaid]
- [Azure Container Registry Deployment - Private Bicep Registry][wiki_acrdeploy]
- [Sample Pipelines][wiki_pipelines]
  - [GitHub Actions][wiki_pipelines_gh]
  - [Azure DevOps][wiki_pipelines_ado]
- [Code Tours][code_tours]

## Overview

The Azure Landing Zones Bicep repo provides an approach for deploying and managing the core platform capabilities of Cloud Adoption Framework Azure Landing Zones conceptual architecture using Bicep.

In its current incarnation each module can be deployed separately via command line but in future releases a more automated approach, via orchestration modules, will be published; but due to current Bicep & ARM limitations this is not possible today.

> Have you seen our page in the Azure Architecture Center here: [Azure landing zones - Bicep modules design considerations][aac_article]

## Getting Started

To get started with ALZ Bicep, please refer to the [Deployment Flow wiki page][wiki_deployment_flow] for:

1. Prerequisites and dependencies for the overall implementation.
2. High-level deployment flow.
3. Links to more detailed instructions on individual modules.

### Azure Enablement Show Videos

We have created a short 3-part series of video on the Azure Enablement Show that can be found below:

<!-- markdownlint-disable -->
#### Part 1 - Introduction to Azure Landing Zones Bicep

[![Part 1 - Introduction to Azure Landing Zones Bicep](https://img.youtube.com/vi/-pZNrH1GOxs/hqdefault.jpg)](https://aka.ms/azenable/94)

#### Part 2 - Azure Landing Zones Bicep - Enabling platform services

[![Part 2 - Azure Landing Zones Bicep - Enabling platform services](https://img.youtube.com/vi/FNT0ZtUxYKQ/hqdefault.jpg)](https://aka.ms/azenable/95)

#### Part 3 - Azure Landing Zones Bicep - Enabling landing zones

[![Part 3 - Azure Landing Zones Bicep - Enabling landing zones](https://img.youtube.com/vi/cZ7IN3zGbyM/hqdefault.jpg)](https://aka.ms/azenable/96)
<!-- markdownlint-restore -->

 [//]: # (************************)
 [//]: # (INSERT LINK LABELS BELOW)
 [//]: # (************************)

[Deployment]:                                 https://github.com/Askerkommune/Azure-Landing-Zone-Bicep/blob/main/deployment.md "Deployment"
[wiki_home]:                                  https://github.com/Azure/ALZ-Bicep/wiki/home "Wiki - Home"
[wiki_deployment_flow]:                            https://github.com/Azure/ALZ-Bicep/wiki/DeploymentFlow "Wiki - Deployment Flow"
[wiki_deployment_flow_hs]:                            https://github.com/Azure/ALZ-Bicep/wiki/DeploymentFlowHS "Wiki - Deployment Flow - Hub and Spoke"
[wiki_deployment_flow_vwan]:                            https://github.com/Azure/ALZ-Bicep/wiki/DeploymentFlowVWAN "Wiki - Deployment Flow - Virtual WAN"
[wiki_consumer_guide]:                          https://github.com/Azure/ALZ-Bicep/wiki/ConsumerGuide "Wiki - Consumer Guide"
[wiki_policy_deep_dive]:                        https://github.com/Azure/ALZ-Bicep/wiki/PolicyDeepDive "Wiki - Policy Deep Dive"
[wiki_policy_defs]:                        https://github.com/Azure/ALZ-Bicep/wiki/AddingPolicyDefs "Wiki - Policy Definitions"
[wiki_policy_assignments]:                        https://github.com/Azure/ALZ-Bicep/wiki/AssigningPolicies "Wiki - Policy Assignments"
[wiki_resiliency]:                            https://github.com/Azure/ALZ-Bicep/wiki/Resiliency "Wiki - Resiliency"
[wiki_contributing]:                          https://github.com/Azure/ALZ-Bicep/wiki/Contributing "Wiki - Contributing"
[wiki_accelerator]:                          <https://github.com/Azure/ALZ-Bicep/wiki/Accelerator> "Wiki - Accelerator"
[wiki_amba]:                            <https://github.com/Azure/ALZ-Bicep/wiki/AzureMonitorBaselineAlerts> "Wiki - AMBA"
[wiki_known_issues]:                          <https://github.com/Azure/ALZ-Bicep/wiki/KnownIssues> "Wiki - Known Issues"
[wiki_faq]:                          <https://github.com/Azure/ALZ-Bicep/wiki/FAQ> "Wiki - FAQs"
[wiki_cuaid]:                          <https://github.com/Azure/ALZ-Bicep/wiki/CustomerUsage> "Wiki - Telemetry Usage ID"
[wiki_acrdeploy]:                          <https://github.com/Azure/ALZ-Bicep/wiki/ACRDeployment> "Wiki - Private Bicep Registry"
[vulnerability_reporting]:                          <https://github.com/Azure/ALZ-Bicep/blob/main/SECURITY.md> "Vulnerability reporting"
[support_statement]:                          <https://github.com/Azure/ALZ-Bicep/blob/main/SUPPORT.md> "Microsoft Support Policy"
[wiki_pipelines]:                          <https://github.com/Azure/ALZ-Bicep/wiki/PipelinesOverview> "Wiki - Sample Pipelines"
[wiki_pipelines_gh]:                          <https://github.com/Azure/ALZ-Bicep/wiki/PipelinesGitHub> "Wiki - Sample Pipelines - GitHub Actions"
[wiki_pipelines_ado]:                          <https://github.com/Azure/ALZ-Bicep/wiki/PipelinesADO> "Wiki - Sample Pipelines - Azure DevOps"
[code_tours]:                                   <https://github.com/Azure/ALZ-Bicep/wiki/CodeTour> "Wiki - Code tours"
[aac_article]:                                  <https://learn.microsoft.com/azure/architecture/landing-zones/bicep/landing-zone-bicep> "Azure Architecture Center - Azure landing zones - Bicep modules design considerations"

