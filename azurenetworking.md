## 1. What is an Azure Virtual Network (VNet)?

A Virtual Network (VNet) is a logically isolated network in Azure that
allows Azure resources such as virtual machines, containers, and
services to communicate with each other, the internet, and on‑premises
networks securely.

## 2. What is a subnet in Azure?

A subnet is a smaller address range inside a Virtual Network. It is used
to segment the network and place resources into separate logical groups
such as web, application, and database tiers.

## 3. What is a Network Security Group (NSG)?

A Network Security Group filters inbound and outbound traffic to Azure
resources using rules based on source IP, destination IP, port, and
protocol.

## 4. How are NSG rules processed?

NSG rules are processed in order of priority. Lower priority numbers are
evaluated first. Once a rule matches, processing stops and the action
(Allow or Deny) is applied.

## 5. What are the default NSG rules?

Azure provides default rules such as AllowVNetInBound,
AllowAzureLoadBalancerInBound, and DenyAllInbound. These ensure internal
VNet communication works while blocking unwanted external traffic.

## 6. What is Azure Load Balancer?

Azure Load Balancer is a Layer 4 load balancer that distributes TCP or
UDP traffic across multiple backend resources to provide high
availability and scalability.

## 7. What is Azure Application Gateway?

Azure Application Gateway is a Layer 7 load balancer designed for HTTP
and HTTPS traffic. It supports features such as path-based routing, SSL
termination, and Web Application Firewall.

## 8. What is Azure Front Door?

Azure Front Door is a global Layer 7 load balancing service that routes
client traffic to the nearest or healthiest backend across multiple
Azure regions.

## 9. Difference between Azure Load Balancer and Application Gateway?

Azure Load Balancer operates at Layer 4 and handles TCP/UDP traffic.
Application Gateway operates at Layer 7 and handles HTTP/HTTPS traffic
with advanced routing features.

## 10. Difference between Front Door and Application Gateway?

Front Door is a global service that routes traffic across regions.
Application Gateway is regional and typically deployed inside a Virtual
Network to route traffic to backend resources.

## 11. What is VNet peering?

VNet peering connects two Virtual Networks so that resources in both
VNets can communicate with each other using private IP addresses through
the Azure backbone network.

## 12. What is Global VNet Peering?

Global VNet Peering connects VNets located in different Azure regions
and allows private communication between them.

## 13. What is Azure VPN Gateway?

Azure VPN Gateway provides encrypted connectivity between Azure VNets
and on‑premises networks using IPsec tunnels.

## 14. What is Site‑to‑Site VPN?

Site‑to‑Site VPN connects an entire on‑premises network to an Azure
Virtual Network using a VPN device and an IPsec tunnel.

## 15. What is Point‑to‑Site VPN?

Point‑to‑Site VPN allows individual devices such as laptops to securely
connect to an Azure Virtual Network.

## 16. What is ExpressRoute?

ExpressRoute provides a private, dedicated connection between an
on‑premises network and Azure that does not traverse the public
internet.

## 17. What is Azure Firewall?

Azure Firewall is a managed cloud firewall service that protects Azure
Virtual Networks by filtering network traffic based on rules.

## 18. What are the rule types in Azure Firewall?

The rule types are Network Rules (IP and port based filtering),
Application Rules (FQDN based filtering), and NAT Rules (port forwarding
from public IP to internal resources).

## 19. What is a NAT Gateway?

A NAT Gateway enables outbound internet connectivity for resources in a
subnet while using a static public IP address.

## 20. What is a Public IP address in Azure?

A Public IP address allows Azure resources to communicate with the
internet.

## 21. What is a Private IP address?

A Private IP address is used for communication between resources inside
a Virtual Network and is not accessible from the internet.

## 22. What is a Private Endpoint?

A Private Endpoint assigns a private IP address from a VNet to an Azure
service, allowing secure access without exposing the service to the
public internet.

## 23. What is a Service Endpoint?

A Service Endpoint extends the VNet identity to Azure services and
allows secure access to those services over the Azure backbone network.

## 24. Difference between Private Endpoint and Service Endpoint?

A Service Endpoint keeps the service public but restricts access from
specific VNets. A Private Endpoint provides a private IP address inside
the VNet for the service.

## 25. What is Azure Bastion?

Azure Bastion is a managed service that allows secure RDP and SSH access
to virtual machines directly through the Azure portal without exposing
public IP addresses.

## 26. What is Azure DNS?

Azure DNS is a hosting service for DNS domains that provides name
resolution using Microsoft's global infrastructure.

## 27. What is Private DNS in Azure?

Private DNS provides internal DNS resolution for resources inside a
Virtual Network.

## 28. What is a User Defined Route (UDR)?

A User Defined Route allows you to override Azure's default system
routes and control how traffic flows within a Virtual Network.

## 29. What is forced tunneling?

Forced tunneling redirects all outbound internet traffic from Azure
resources to on‑premises networks or security appliances for inspection.

## 30. What is Azure DDoS Protection?

Azure DDoS Protection mitigates distributed denial-of-service attacks
targeting applications running in Azure.

## 31. What is a Network Virtual Appliance (NVA)?

A Network Virtual Appliance is a virtual machine used to perform network
functions such as firewall, routing, or intrusion detection.

## 32. What is Hub‑and‑Spoke architecture?

Hub‑and‑Spoke architecture is a network topology where a central hub
VNet hosts shared services like firewalls and gateways while spoke VNets
host application workloads.

## 33. What is IP forwarding in Azure?

IP forwarding allows a virtual machine to receive network traffic not
originally destined for it, commonly used in network virtual appliances.

## 34. What is Azure Traffic Manager?

Azure Traffic Manager is a DNS‑based traffic routing service that
directs clients to endpoints based on routing methods such as priority,
performance, or geographic location.

## 35. What is a route table in Azure?

A route table contains routing rules that determine how network traffic
is directed within a Virtual Network.

## 36. What is an Application Security Group (ASG)?

An Application Security Group allows grouping of virtual machines so
that NSG rules can be applied based on application groups instead of IP
addresses.

## 37. What is outbound connectivity in Azure?

Outbound connectivity allows resources inside Azure to access external
services on the internet.

## 38. What is inbound connectivity?

Inbound connectivity allows external users to access Azure resources
such as web applications or virtual machines.

## 39. What is SNAT?

Source Network Address Translation replaces the source private IP
address with a public IP when sending traffic to external networks.

## 40. What is DNAT?

Destination Network Address Translation maps a public IP and port to a
private IP and port inside a network.

## 41. What is a Gateway Subnet?

A Gateway Subnet is a dedicated subnet used to deploy Azure VPN Gateway
or ExpressRoute Gateway.

## 42. What is Azure Private Link?

Azure Private Link enables private connectivity from a VNet to Azure
services using private IP addresses.

## 43. What is Azure Virtual WAN?

Azure Virtual WAN is a networking service that provides optimized branch
connectivity to Azure and integrates networking, security, and routing
services.

## 44. What is Web Application Firewall (WAF)?

A Web Application Firewall protects web applications from common attacks
such as SQL injection and cross‑site scripting.

## 45. Where can WAF be deployed in Azure?

WAF can be deployed with Application Gateway, Azure Front Door, and
Azure CDN.

## 46. What is a backend pool in a load balancer?

A backend pool is a group of servers or resources that receive traffic
distributed by a load balancer.

## 47. What is a health probe in Azure Load Balancer?

A health probe checks the status of backend instances to determine
whether they are healthy enough to receive traffic.

## 48. What is Anycast routing?

Anycast routing directs user traffic to the nearest available service
endpoint based on network topology.

## 49. What is a peering gateway transit?

Gateway transit allows one VNet to use a VPN gateway deployed in another
VNet through VNet peering.

## 50. What is Azure network watcher?

Azure Network Watcher is a monitoring service that provides tools for
diagnosing and monitoring network connectivity issues.

## 51. What is connection monitor?

Connection Monitor is a Network Watcher feature used to monitor
connectivity between Azure resources.

## 52. What is packet capture?

Packet capture is a diagnostic feature used to capture network traffic
to analyze connectivity issues.

## 53. What is NSG flow logging?

NSG flow logs capture information about IP traffic flowing through a
Network Security Group.

## 54. What is Azure firewall policy?

Azure Firewall Policy is used to centrally manage firewall rules across
multiple Azure Firewalls.

## 55. What is Azure edge network?

The Azure edge network consists of globally distributed points of
presence used by services like Front Door and CDN.

## 56. What is a spoke VNet?

A spoke VNet is a network that connects to a central hub VNet in a
hub‑and‑spoke architecture.

## 57. What is east‑west traffic?

East‑west traffic refers to communication between resources within the
same network or between VNets.

## 58. What is north‑south traffic?

North‑south traffic refers to communication between internal resources
and external networks such as the internet.

## 59. What is a backend address pool?

A backend address pool is the group of servers that receive traffic from
a load balancer.

## 60. What is SSL termination?

SSL termination is the process where HTTPS traffic is decrypted at a
load balancer or gateway before being forwarded to backend servers.
