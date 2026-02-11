## 1. Azure Virtual Machines (VMs)

**Q1: What types of Azure VMs are available and when would you use each?**  
Azure provides several VM types including General Purpose (balanced CPU & memory), Compute Optimized (high CPU workloads), Memory Optimized (large in-memory apps), Storage Optimized (high disk throughput), and GPU VMs (machine learning or rendering). The type depends on workload requirements and cost considerations.

**Q2: How do you resize an Azure VM?**  
You can resize an Azure VM through the Azure portal, CLI, or PowerShell. The VM must be stopped/deallocated before resizing to a new size, and you should ensure the new VM size is compatible with the existing VM region and storage configuration.

**Q3: Explain Azure VM Scale Sets and their benefits.**  
VM Scale Sets allow you to deploy and manage a set of identical VMs, providing automatic scaling based on demand. They improve application availability, simplify management, and integrate with load balancers for high availability.

**Q4: How can you automate VM deployment using ARM templates or Terraform?**  
ARM templates and Terraform allow Infrastructure as Code (IaC), defining resources in JSON (ARM) or HCL (Terraform). These tools enable repeatable, consistent deployments, version control, and automation of VM creation, networking, storage, and configurations.

**Q5: What is the difference between managed and unmanaged disks in Azure VMs?**  
Managed disks are handled by Azure and provide high availability, scalability, and simplified management, while unmanaged disks require you to manage storage accounts yourself. Managed disks are recommended for production workloads due to reliability and easier backup/replication.

---

## 2. Azure Networking

**Q1: Explain Azure Virtual Network (VNet) and its components.**  
A VNet is a logical representation of your network in Azure. Components include subnets (logical divisions), route tables, network security groups (NSGs), VPN gateways, and peering connections. VNets provide isolation and secure communication for Azure resources.

**Q2: What are Network Security Groups (NSGs) and how are they different from Azure Firewall?**  
NSGs control inbound and outbound traffic at the subnet or NIC level using rules. Azure Firewall is a fully managed, centralized network security service that provides threat protection, logging, and advanced filtering, whereas NSGs are simpler and localized.

**Q3: How would you set up VNet peering?**  
VNet peering connects two VNets in the same or different regions, enabling private IP communication. You configure peering on both VNets, and traffic flows securely over the Microsoft backbone without using public internet.

**Q4: Describe Azure Application Gateway and when you would use it.**  
Application Gateway is a Layer 7 load balancer that handles HTTP/HTTPS traffic. It provides features like SSL termination, WAF (Web Application Firewall), and cookie-based session affinity. Use it for web apps needing advanced routing and protection.

**Q5: What is an Azure Load Balancer and how does it differ from Application Gateway?**  
Azure Load Balancer is a Layer 4 (TCP/UDP) service that distributes traffic evenly among VMs. Unlike Application Gateway, it does not inspect HTTP content or provide WAF; it is ideal for high-performance, low-latency network traffic distribution.

---

## 3. Azure Storage

**Q1: What types of storage accounts exist in Azure and their use cases?**  
Azure offers General Purpose v2 (all-purpose), Blob Storage (object storage), File Storage (SMB file shares), Queue Storage (message queuing), and Table Storage (NoSQL key-value). Choice depends on performance, redundancy, and application requirements.

**Q2: Explain the difference between Blob, File, Table, and Queue storage.**  
Blob storage is for unstructured data like images and videos. File storage provides SMB/NFS file shares. Table storage is NoSQL for structured data. Queue storage is for asynchronous messaging between components.

**Q3: How do you secure data in Azure Storage?**  
You can secure storage using Shared Access Signatures (SAS), Azure AD integration, encryption at rest, firewall rules, private endpoints, and storage account access policies to restrict access.

**Q4: What are Azure Storage lifecycle management policies?**  
Lifecycle management allows automatic transitioning of blobs to cooler tiers or deletion based on age or access patterns, optimizing cost and managing data retention efficiently.

**Q5: How would you integrate Azure Storage with an Azure Function?**  
Azure Functions can use Blob, Queue, or Table bindings to automatically trigger functions on storage events. Connection strings or managed identities are used for authentication and secure access.

---

## 4. Azure Key Vault

**Q1: What is Azure Key Vault and why is it important?**  
Key Vault is a secure cloud service for storing secrets, keys, and certificates. It helps protect sensitive information and simplifies key management by centralizing access control and auditing.

**Q2: Explain the difference between secrets, keys, and certificates in Key Vault.**  
Secrets are simple strings (passwords, API keys), keys are cryptographic keys for encryption/decryption, and certificates store public/private key pairs with metadata for secure communication.

**Q3: How can you integrate Key Vault with Azure DevOps pipelines?**  
You can use Azure Key Vault task in pipelines to fetch secrets at runtime, ensuring sensitive data isn’t hardcoded in scripts. Service connections or managed identities are used for secure access.

**Q4: How do you manage access policies in Key Vault?**  
Access policies define which users or applications can perform operations on keys, secrets, or certificates. Policies can be set in the portal, CLI, or via ARM templates for fine-grained control.

**Q5: Describe a scenario for using Key Vault in a production application.**  
A web app retrieving database credentials or API keys at runtime from Key Vault ensures secrets are never exposed in code or configuration files, enhancing security and compliance.

---

## 5. Azure Serverless Apps

**Q1: What is Azure Functions and how does it differ from Web Apps?**  
Azure Functions is a serverless compute service that runs code on-demand without provisioning or managing servers. Unlike Web Apps, which are always running and host entire applications, Functions execute in response to events and scale automatically based on load, reducing cost for intermittent workloads.

**Q2: Explain triggers and bindings in Azure Functions.**  
Triggers are events that start the execution of a function, such as HTTP requests, timers, or messages in a queue. Bindings simplify input/output handling by declaratively connecting functions to storage, databases, or messaging services without writing boilerplate code.

**Q3: How do you monitor serverless apps in Azure?**  
Monitoring can be done using Azure Monitor, Application Insights, and built-in logging in Functions. These tools provide metrics like execution count, duration, failures, and dependencies, helping detect performance bottlenecks or errors in production.

**Q4: How would you manage secrets for a serverless application?**  
Secrets can be stored in **Azure Key Vault** and retrieved using managed identities at runtime. This avoids hardcoding sensitive information and allows automatic secret rotation and centralized access control.

**Q5: Discuss scaling options for Azure Functions.**  
Azure Functions scale automatically based on the number of incoming events in the **Consumption Plan**, while **Premium Plan** supports pre-warmed instances for zero cold-start. You can also scale manually or define maximum instance limits for predictable performance.

---

## 6. Azure Security & Firewalls

**Q1: Explain the difference between Azure Firewall and NSG.**  
NSGs control traffic at subnet or NIC level using allow/deny rules, suitable for basic traffic filtering. Azure Firewall is a fully managed service that provides advanced Layer 7 filtering, threat intelligence, logging, and centralized security management across multiple VNets.

**Q2: What is a Web Application Firewall (WAF) in Azure?**  
WAF is a security feature available on Azure Application Gateway and Front Door that protects web applications from common attacks like SQL injection, XSS, and DDoS. It filters HTTP/HTTPS traffic at the application layer, ensuring only safe requests reach your app.

**Q3: How would you restrict access to Azure resources using ASGs (Application Security Groups)?**  
ASGs allow you to define groups of VMs with similar functions and apply NSG rules to the group. This simplifies management and enhances security by controlling traffic between groups without specifying individual IP addresses.

**Q4: Explain how DDoS protection works in Azure.**  
Azure DDoS Protection monitors traffic to your public endpoints and automatically mitigates volumetric attacks, ensuring application availability. It provides metrics, alerts, and integrates with network monitoring for proactive defense.

**Q5: How do you audit network traffic in Azure?**  
You can use **Azure Network Watcher**, NSG flow logs, Azure Firewall logs, and Azure Monitor to track traffic. These tools allow auditing, threat detection, and analysis for compliance and troubleshooting purposes.

---

## 7. Advanced Networking & Security

**Q1: What is VNet service endpoint and how is it used?**  
Service endpoints extend a VNet’s private address space to Azure services like Storage and SQL, allowing secure access without public IPs. They simplify security by restricting access from specific VNets to your services.

**Q2: How would you connect on-premises networks to Azure VNets?**  
You can connect on-premises networks using **VPN Gateway** for site-to-site connections or **ExpressRoute** for dedicated private links with higher throughput and reliability. Both methods enable hybrid cloud architectures.

**Q3: Explain the difference between Azure Route Table and User Defined Routes (UDR).**  
Route Tables define routing rules for a subnet, while UDRs are custom routes that override default system routes. They allow controlling traffic flow, for example, directing outbound traffic through a firewall or network virtual appliance.

**Q4: How do Azure Private Link and Private Endpoint work?**  
Private Link provides secure private connectivity to Azure services over a VNet, while Private Endpoints assign a private IP to the resource, keeping traffic entirely within Azure’s backbone. This ensures secure access without public exposure.

**Q5: Describe a scenario using VNet, NSG, ASG, and Firewall together.**  
A multi-tier web app can have a VNet with separate subnets for web, app, and database layers. NSGs restrict traffic at subnet/NIC level, ASGs group VMs for simplified NSG management, and Azure Firewall controls outbound/inbound traffic centrally for additional security.

---

## 8. DevOps Practices in Azure

**Q1: How do you implement CI/CD pipelines in Azure DevOps?**  
CI/CD pipelines in Azure DevOps are created using **Build (CI)** and **Release (CD)** pipelines. Automated builds, tests, and deployments ensure faster and consistent delivery to multiple environments with integrated approval workflows.

**Q2: Explain Infrastructure as Code (IaC) using ARM templates, Bicep, or Terraform.**  
IaC allows defining infrastructure declaratively. ARM templates and Bicep are native Azure tools, while Terraform is cloud-agnostic. IaC ensures repeatable deployments, version control, and reduces human errors in environment setup.

**Q3: How do you monitor applications and infrastructure in Azure using Azure Monitor?**  
Azure Monitor collects metrics, logs, and alerts from resources. Combined with Application Insights, it provides real-time visibility, performance metrics, anomaly detection, and diagnostic capabilities for troubleshooting.

**Q4: How would you handle secrets and environment variables in pipelines?**  
Secrets can be stored in Azure Key Vault or pipeline secret variables. Using these ensures sensitive information isn’t exposed in scripts, logs, or source control while allowing automated secure access during deployment.

**Q5: How can Azure DevOps integrate with Kubernetes or AKS?**  
Azure DevOps pipelines can build container images, push them to Azure Container Registry, and deploy to AKS using **kubectl**, Helm, or Terraform. Pipelines can include automated tests and rollout strategies like blue-green or canary deployments.

---

## 9. Scenario-Based Questions

**Q1: You need to deploy a multi-tier web app in Azure with high availability and security. How would you architect it?**  
Use multiple subnets in a VNet for web, app, and database layers. Deploy VMs or AKS clusters in availability zones, use Azure Load Balancer or Application Gateway for traffic distribution, and apply NSGs, Firewall, and ASGs for security. Store secrets in Key Vault and use managed identities for secure access.

**Q2: A production VM is not responding. How do you troubleshoot connectivity issues?**  
Check the VM’s **boot diagnostics**, network interface, NSG rules, and effective routes. Use Azure Network Watcher tools like IP flow verification and packet capture. Ensure the VM isn’t stopped/deallocated and disk resources are healthy.

**Q3: You need to rotate secrets in Key Vault without downtime. How would you do it?**  
Use **Key Vault versions** and update application references gradually to point to the new secret version. Managed identities allow seamless authentication without code changes, ensuring applications continue running while secrets rotate.

**Q4: Your function app is failing during peak load. How would you diagnose and scale it?**  
Check execution logs and Application Insights for bottlenecks or errors. Analyze cold-start times, increase plan from Consumption to Premium if needed, and configure auto-scaling or pre-warmed instances to handle peak load.

**Q5: You need to restrict access to Azure Storage accounts from only specific VNets. How would you implement it?**  
Enable **service endpoints or Private Endpoints** for the storage account. Configure firewall rules to allow traffic only from the required VNets/subnets, blocking public access. Combine with NSG rules for additional layer of control.
