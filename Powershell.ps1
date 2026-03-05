# ============================================================
# 1. What is PowerShell and how is it different from CMD?
# ============================================================
# PowerShell is a task automation and configuration management framework
# built on top of .NET. Unlike CMD, which works with plain text output,
# PowerShell works with structured objects. This allows us to directly
# access properties like Status, Name, CPU instead of parsing strings.
# In DevOps, this object-based pipeline makes automation much more reliable.


# ============================================================
# 2. What is the PowerShell Pipeline?
# ============================================================
# The pipeline passes full .NET objects from one command to another.
# Each command processes objects rather than raw text.
# This allows filtering, sorting, and transforming data efficiently.
#
Get-Service | Where-Object Status -eq "Running"


# ============================================================
# 3. What does $_ represent?
# ============================================================
# $_ represents the current object being processed in the pipeline.
# It is mainly used inside script blocks like Where-Object and ForEach-Object
# to reference each item.
#
Get-Process | Where-Object { $_.CPU -gt 100 }


# ============================================================
# 4. Difference between foreach and ForEach-Object
# ============================================================
# foreach is a language construct used when the data is already loaded
# into memory. It is generally faster and preferred for large datasets
# and complex logic.
#
# ForEach-Object works in the pipeline and processes objects as they
# stream through the pipeline. It is useful for inline operations.
#
$vms = Get-Process
foreach ($vm in $vms) {
    Write-Output $vm.Name
}


# ============================================================
# 5. What is Execution Policy?
# ============================================================
# Execution Policy controls how PowerShell handles script execution.
# It is a safety mechanism to prevent accidental execution of malicious scripts.
# It is not a full security boundary but a preventive control.


# ============================================================
# 6. Explain RemoteSigned -Scope CurrentUser
# ============================================================
# RemoteSigned allows locally created scripts to run freely,
# but requires scripts downloaded from the internet to be digitally signed.
# Scope CurrentUser applies this rule only to the logged-in user,
# which avoids needing administrative privileges.


# ============================================================
# 7. What does -WhatIf do?
# ============================================================
# The -WhatIf parameter simulates execution of a command
# without making any changes. It is extremely useful when performing
# destructive operations like deleting files or stopping services.
# In production DevOps environments, I use -WhatIf before applying changes.


# ============================================================
# 8. How do you handle errors in PowerShell?
# ============================================================
# I use structured error handling with Try/Catch/Finally blocks.
# This ensures the script does not fail silently and logs meaningful errors.
#
try {
    Get-Item "C:\InvalidPath" -ErrorAction Stop
}
catch {
    Write-Error "An error occurred: $_"
}


# ============================================================
# 9. What is Idempotency?
# ============================================================
# Idempotency means running the script multiple times
# produces the same result without causing side effects.
# I always check the current state before applying changes.
#
if ((Get-Service Spooler).Status -ne "Running") {
    Start-Service Spooler
}


# ============================================================
# 10. How do you securely manage credentials?
# ============================================================
# In enterprise environments, I avoid storing passwords in scripts.
# I use Azure Key Vault or managed identities.
# SecureString is used only for in-memory encryption,
# but Key Vault is the recommended production approach.


# ============================================================
# 11. What is SecureString?
# ============================================================
# SecureString stores sensitive information in encrypted format in memory.
# It prevents exposure of plain-text passwords.
#
$password = Read-Host "Enter Password" -AsSecureString


# ============================================================
# 12. What is PowerShell Remoting?
# ============================================================
# PowerShell Remoting allows executing commands on remote machines.
# It uses WinRM protocol and is essential in server automation.
#
Invoke-Command -ComputerName Server1 -ScriptBlock { Get-Service }


# ============================================================
# 13. Difference between -eq and -like
# ============================================================
# -eq checks exact equality.
# -like supports wildcard matching.
#
"VM01" -eq "VM01"
"VM01" -like "VM*"


# ============================================================
# 14. How do you schedule a script?
# ============================================================
# I use Task Scheduler or Register-ScheduledTask in automation scenarios.
# In Azure, I use Azure Automation Runbooks or pipeline scheduled triggers.


# ============================================================
# 15. What is a PowerShell Module?
# ============================================================
# A module is a collection of reusable functions packaged together.
# It improves code organization, reusability, and maintainability.
# In DevOps, I create internal modules for common automation tasks.


# ============================================================
# 16. How do you debug complex scripts?
# ============================================================
# I enable verbose logging, use breakpoints in VS Code,
# implement detailed logs, and test in lower environments before production.
#
$VerbosePreference = "Continue"
Write-Verbose "Debugging enabled"


# ============================================================
# 17. Azure CLI vs Azure PowerShell
# ============================================================
# Azure CLI is cross-platform and returns JSON.
# Azure PowerShell returns structured objects and integrates
# better with PowerShell scripting.


# ============================================================
# 18. Write-Output vs Write-Host
# ============================================================
# Write-Output sends data to pipeline.
# Write-Host writes directly to console and cannot be piped.
# In production scripts, I prefer Write-Output.


# ============================================================
# 19. What is PowerShell DSC?
# ============================================================
# Desired State Configuration ensures systems remain
# in a defined configuration state.
# It is declarative and helps enforce idempotency.


# ============================================================
# 20. How do you import CSV data?
# ============================================================
# Import-Csv converts CSV rows into PowerShell objects,
# making automation easier when processing bulk data.


# ============================================================
# 21. What is Custom Script Extension in Azure VMSS?
# ============================================================
# It allows running scripts during VM provisioning.
# It is commonly used for bootstrapping servers
# in auto-scaling environments.


# ============================================================
# 22. What is a Process?
# ============================================================
# A process is a running instance of a program in memory.
# It has a Process ID and consumes system resources.


# ============================================================
# 23. What is a Service?
# ============================================================
# A service runs in the background and provides
# system-level functionality without user interaction.


# ============================================================
# 24. What is a Scheduled Task?
# ============================================================
# A scheduled task executes programs based on triggers
# like time, startup, or events.


# ============================================================
# 25. How do you pass parameters to scripts?
# ============================================================
param(
    [string]$VMName
)
# Parameterization improves reusability and flexibility.


# ============================================================
# 26. What is the difference between Write-Verbose and Write-Debug?
# ============================================================
# Write-Verbose provides detailed informational messages.
# Write-Debug provides debugging-specific messages and requires -Debug flag.


# ============================================================
# 27. How do you ensure scripts are production-ready?
# ============================================================
# I ensure modular design, logging, error handling,
# idempotency, secure credentials, and version control.


# ============================================================
# 28. How do you version control scripts?
# ============================================================
# All scripts are stored in Git repositories.
# I use branching strategy, pull requests, and tagging for releases.


# ============================================================
# 29. How do you use PowerShell in Azure DevOps?
# ============================================================
# PowerShell is used in pipelines for infrastructure provisioning,
# application deployment, configuration management, and validation.


# ============================================================
# 30. What is the biggest advantage of PowerShell in DevOps?
# ============================================================
# The biggest advantage is object-based automation,
# deep Windows and Azure integration,
# and the ability to combine scripting with cloud operations
# in a structured and maintainable way.

# ============================================================
# QUESTION 31:
# Explain the PowerShell pipeline and why it is powerful.
# ============================================================

# Answer:
# The PowerShell pipeline passes structured .NET objects between commands
# rather than plain text. This allows direct access to properties like Status,
# Name, or CPU without parsing output manually. Because it works with objects,
# automation becomes more reliable, readable, and maintainable. Compared to
# traditional shells that rely on text processing, PowerShell reduces errors
# and improves script clarity.


# ============================================================
# QUESTION 32:
# What is idempotency and why is it important in DevOps?
# ============================================================

# Answer:
# Idempotency means that running a script multiple times results in the same
# system state without causing unintended side effects. In DevOps, this prevents
# configuration drift and ensures predictable deployments. I implement
# idempotency by checking the current state before applying any changes.


# ============================================================
# QUESTION 33:
# Difference between foreach and ForEach-Object?
# ============================================================

# Answer:
# 'foreach' is a language construct used when the collection is already loaded
# into memory and is generally faster. It is ideal for large datasets and
# complex logic. 'ForEach-Object' works within the pipeline and processes
# objects as they stream through. I choose between them based on performance
# requirements and script structure.


# ============================================================
# QUESTION 34:
# How do you securely manage credentials in automation?
# ============================================================

# Answer:
# I never hardcode credentials inside scripts. In Azure environments,
# I use Managed Identity or Azure Key Vault for secure secret management.
# If credentials must be handled within PowerShell, I use PSCredential
# objects and SecureString to avoid exposing sensitive information.


# ============================================================
# QUESTION 35:
# Explain Execution Policy and its scopes.
# ============================================================

# Answer:
# Execution Policy controls how PowerShell runs scripts. It is a safety
# mechanism to prevent accidental execution of untrusted scripts and
# should not be considered a security boundary. Scopes include Process,
# CurrentUser, and LocalMachine. In development environments, I commonly
# use RemoteSigned at the CurrentUser scope.


# ============================================================
# QUESTION 36:
# How do you debug complex PowerShell scripts?
# ============================================================

# Answer:
# I implement structured logging using Write-Verbose and proper log files.
# I use Try/Catch blocks to capture meaningful error information.
# During development, I use breakpoints and debugging tools in VS Code.
# In production, I validate changes in staging before deployment.


# ============================================================
# QUESTION 37:
# What does -WhatIf do and why is it important?
# ============================================================

# Answer:
# The -WhatIf parameter simulates command execution without applying changes.
# It is especially important for destructive operations such as deleting
# files, modifying infrastructure, or stopping services. In production,
# I use -WhatIf to validate the impact before executing changes.


# ============================================================
# QUESTION 38:
# How do you structure long PowerShell scripts for maintainability?
# ============================================================

# Answer:
# I structure long scripts using modular design with reusable functions
# and custom modules. I separate configuration, business logic, and execution
# layers. I also implement parameter validation, logging, and consistent
# naming conventions. All scripts are version-controlled using Git.


# ============================================================
# QUESTION 39:
# What is PowerShell Remoting and when would you use it?
# ============================================================

# Answer:
# PowerShell Remoting allows executing commands on remote machines using
# the WinRM protocol. It is essential for managing multiple servers,
# performing bulk updates, and automating infrastructure in hybrid cloud
# environments. I frequently use Invoke-Command for remote operations.


# ============================================================
# QUESTION 40:
# How do you use PowerShell in Azure DevOps pipelines?
# ============================================================

# Answer:
# In Azure DevOps pipelines, PowerShell is used for infrastructure
# provisioning, application deployment, configuration management,
# and validation tasks. I typically use AzurePowerShell tasks with
# secure service connections. Scripts are parameterized to support
# multiple environments such as Dev, QA, and Production.


<#
====================================================================
PowerShell Advanced Scenario-Based Questions (41–60)
Azure DevOps Engineer – Senior Level
Strong Interview-Level Answers Only
====================================================================
#>

# ============================================================
# QUESTION 41:
# You need to stop multiple services on multiple servers only if they are running. How do you approach this in PowerShell?
# ============================================================

# Answer:
# I would use Get-Service with a filter for the target services, then pipeline
# to Where-Object to check the Status property. I would then use Stop-Service
# on the filtered list. Using Invoke-Command allows me to execute this across
# multiple remote servers efficiently.
#
# Example:
# $servers = @("Server1","Server2")
# $services = "Spooler","wuauserv"
# Invoke-Command -ComputerName $servers -ScriptBlock {
#     Get-Service -Name $using:services | Where-Object { $_.Status -eq "Running" } | Stop-Service
# }


# ============================================================
# QUESTION 42:
# You need to deploy a configuration change to 50 Azure VMs in a VMSS. How would you automate this?
# ============================================================

# Answer:
# I would use Azure VMSS Custom Script Extension with PowerShell scripts to
# apply the configuration during scale-in or scale-out operations. I ensure
# scripts are idempotent and stored in a central repository like Git.
# I may also trigger deployment using Azure DevOps pipeline or Azure Automation Runbook.


# ============================================================
# QUESTION 43:
# You have a CSV with server names and applications. You need to check application status across all servers.
# ============================================================

# Answer:
# I would use Import-Csv to read the file, then loop through each row using
# foreach or ForEach-Object. I would use Invoke-Command to query application
# status remotely, capturing results into an object or log file for reporting.
#
# Example:
# $servers = Import-Csv "servers.csv"
# foreach ($row in $servers) {
#     Invoke-Command -ComputerName $row.Server -ScriptBlock {
#         Get-Process -Name $using:row.Application
#     }
# }


# ============================================================
# QUESTION 44:
# How would you rotate credentials in scripts for security compliance?
# ============================================================

# Answer:
# I store credentials in Azure Key Vault and fetch them at runtime.
# Scripts do not store secrets. If rotation occurs, new credentials are updated
# in Key Vault, and scripts automatically use the latest version.
# This prevents manual intervention and meets compliance requirements.


# ============================================================
# QUESTION 45:
# How would you automate restarting a service that fails randomly in production?
# ============================================================

# Answer:
# I would create a monitoring script that checks the service state periodically.
# If the service is stopped or failed, the script attempts a restart, logs the
# incident, and optionally sends an alert. I ensure idempotency and include
# error handling to avoid cascading failures.
#
# Example:
# $service = Get-Service "MyService"
# if ($service.Status -ne "Running") { Restart-Service $service.Name }


# ============================================================
# QUESTION 46:
# You need to copy files from multiple servers to a central location and avoid duplicates. How?
# ============================================================

# Answer:
# I would use Invoke-Command to gather file paths from remote servers,
# then copy files using Copy-Item with -Force or checksums to prevent duplicates.
# I can also use robocopy from PowerShell for optimized transfers with retry logic.


# ============================================================
# QUESTION 47:
# A scheduled task sometimes fails due to resource contention. How do you handle it?
# ============================================================

# Answer:
# I would wrap the scheduled task logic in Try/Catch, log failures, and implement
# retries with exponential backoff. If using Azure Automation, I can use runbook
# retry policies. Monitoring alerts can also trigger manual intervention if needed.


# ============================================================
# QUESTION 48:
# How do you ensure a PowerShell script can run across multiple environments (Dev, QA, Prod) without code changes?
# ============================================================

# Answer:
# I parameterize scripts and store environment-specific values in configuration
# files or variables. Using parameters, the same script can target different
# environments. I avoid hardcoding environment-specific details.


# ============================================================
# QUESTION 49:
# You need to perform bulk user account creation in Azure AD using PowerShell. How would you approach it?
# ============================================================

# Answer:
# I would use Import-Csv to read user details and the AzureAD/AzureADPreview
# module to create accounts. I would include error handling, logging, and checks
# for existing users to maintain idempotency.
#
# Example:
# $users = Import-Csv "users.csv"
# foreach ($user in $users) {
#     if (-not (Get-AzureADUser -ObjectId $user.Email -ErrorAction SilentlyContinue)) {
#         New-AzureADUser -DisplayName $user.DisplayName -UserPrincipalName $user.Email -AccountEnabled $true
#     }
# }


# ============================================================
# QUESTION 50:
# How would you monitor and log performance metrics of multiple servers?
# ============================================================

# Answer:
# I use Get-Counter to retrieve CPU, Memory, and Disk metrics. I schedule
# scripts to run periodically and export results to CSV or a database.
# For Azure servers, I can also integrate with Log Analytics for centralized monitoring.


# ============================================================
# QUESTION 51:
# You need to deploy patches to Windows servers using PowerShell. How?
# ============================================================

# Answer:
# I use PSWindowsUpdate module to check and install patches. I script
# the update process to run during maintenance windows, log success/failures,
# and optionally trigger reboots. I also implement idempotency to skip
# already installed updates.


# ============================================================
# QUESTION 52:
# How would you handle long-running scripts that may timeout in Azure DevOps pipelines?
# ============================================================

# Answer:
# I break the scripts into smaller steps, using stages or jobs in the pipeline.
# I also ensure logging is incremental. For very long operations, I can use
# Azure Automation runbooks or background jobs to avoid pipeline timeout.


# ============================================================
# QUESTION 53:
# How do you handle retry logic in scripts for transient Azure errors?
# ============================================================

# Answer:
# I implement Try/Catch with a loop and exponential backoff. I log retries
# and include a maximum retry count. This ensures scripts do not fail
# permanently due to transient network or service issues.


# ============================================================
# QUESTION 54:
# How would you validate that a configuration script has applied changes correctly?
# ============================================================

# Answer:
# I implement verification steps after applying changes. For example,
# checking service status, file presence, registry keys, or Azure resource state.
# This ensures the script not only runs but achieves the intended effect.


# ============================================================
# QUESTION 55:
# You need to export server inventory including OS, roles, and installed features. How?
# ============================================================

# Answer:
# I use Get-ComputerInfo and Get-WindowsFeature to gather server details,
# then export results using Export-Csv. I can run this via Invoke-Command
# for multiple servers, ensuring a centralized inventory.


# ============================================================
# QUESTION 56:
# How do you handle dynamic VM scaling in Azure VMSS with custom scripts?
# ============================================================

# Answer:
# I use Custom Script Extension to run PowerShell scripts on VMSS instances
# during scale-out. Scripts are idempotent to prevent repeated changes
# and stored in a central repository for version control.


# ============================================================
# QUESTION 57:
# How would you archive logs older than 30 days across multiple servers?
# ============================================================

# Answer:
# I would use Get-ChildItem with a filter on LastWriteTime, then use
# Move-Item or Compress-Archive to move logs to an archive folder.
# The script can run as a scheduled task or through Azure Automation.


# ============================================================
# QUESTION 58:
# How would you manage different versions of PowerShell modules across environments?
# ============================================================

# Answer:
# I use PowerShellGet to install specific module versions per environment.
# I also store modules in a private repository or artifact feed to ensure
# consistent module versions and avoid breaking changes.


# ============================================================
# QUESTION 59:
# How do you handle sensitive configuration data in scripts for multiple environments?
# ============================================================

# Answer:
# I store sensitive information in Azure Key Vault and reference it
# in scripts via secure authentication. I avoid storing passwords or secrets
# in source code or configuration files.


# ============================================================
# QUESTION 60:
# You need to automate cleanup of temporary files across all servers nightly. How?
# ============================================================

# Answer:
# I write a script that uses Get-ChildItem with filters on temp directories,
# remove files older than a threshold, and log actions. The script can be
# scheduled as a Task Scheduler job or run via Azure Automation across servers.

# End of File

<#
====================================================================
PowerShell Real-World Production Failure Troubleshooting Questions
Azure DevOps Engineer – Senior Level
Strong Interview-Level Answers Only
====================================================================
#>

# ============================================================
# QUESTION 1:
# A scheduled script fails intermittently on a production server. How do you troubleshoot?
# ============================================================

# Answer:
# I check event logs for errors, inspect the script logs for failure points,
# and verify environment dependencies (network, disk, credentials). I also
# consider resource contention and concurrent tasks. Once identified, I fix
# root causes and implement retries or monitoring to prevent recurrence.


# ============================================================
# QUESTION 2:
# A VMSS instance fails to apply a Custom Script Extension. How do you investigate?
# ============================================================

# Answer:
# I review VMSS instance logs and Azure activity logs. I validate the script
# syntax and accessibility from the VM. Common issues include incorrect
# paths, permissions, or network restrictions. After fixing, I test on a single
# instance before scaling.


# ============================================================
# QUESTION 3:
# PowerShell pipeline commands are failing due to object type mismatch. How do you handle it?
# ============================================================

# Answer:
# I inspect the output of each command in the pipeline using Get-Member.
# I ensure that downstream commands receive objects of the expected type.
# Type casting or property selection may be applied to resolve mismatches.


# ============================================================
# QUESTION 4:
# A deployment script in Azure DevOps pipeline hangs indefinitely. What steps do you take?
# ============================================================

# Answer:
# I break the script into smaller steps and test each in isolation.
# I add verbose logging to identify the hanging step. I also check
# for authentication, network latency, and resource locks. Timeouts
# or background jobs may be implemented for long-running commands.


# ============================================================
# QUESTION 5:
# A PowerShell script fails with 'Access Denied' when connecting to remote servers.
# ============================================================

# Answer:
# I verify credentials, WinRM configuration, and account permissions.
# I ensure that the remote server allows PowerShell remoting and that
# the service account has proper roles. Using explicit PSCredential objects
# with secure passwords can resolve access issues.


# ============================================================
# QUESTION 6:
# Azure PowerShell commands intermittently fail due to throttling. How do you mitigate?
# ============================================================

# Answer:
# I implement retry logic with exponential backoff. I also split bulk
# operations into smaller batches and monitor subscription limits.
# Using parallel processing carefully helps avoid throttling while improving performance.


# ============================================================
# QUESTION 7:
# A script that deletes old files accidentally removed important data. How do you prevent this?
# ============================================================

# Answer:
# I implement the -WhatIf parameter for destructive commands during testing.
# I also include verification steps before deletion, logging, and backup
# mechanisms. In production, scripts run in a controlled and monitored environment.


# ============================================================
# QUESTION 8:
# A scheduled PowerShell task fails on some servers but not others. How do you identify the cause?
# ============================================================

# Answer:
# I compare environments, including OS version, module versions,
# execution policy, and scheduled task configuration. Differences in
# permissions, dependencies, or path variables often cause inconsistent behavior.


# ============================================================
# QUESTION 9:
# A script using AzureRM modules fails after migrating to Az modules. How do you fix it?
# ============================================================

# Answer:
# I review module compatibility and update commands to the Az module syntax.
# I test scripts in a staging environment and ensure all references
# to old module cmdlets are replaced. Version locking and documentation
# help prevent future migration issues.


# ============================================================
# QUESTION 10:
# A service restart script causes downtime due to dependent services. How do you handle this?
# ============================================================

# Answer:
# I identify dependencies using Get-Service and plan the restart order.
# I implement checks to ensure dependent services are stopped gracefully
# and restarted properly. Logging and notifications help track impact and rollback if needed.

# End of File


