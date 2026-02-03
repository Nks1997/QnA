CLOUD & NETWORKING INTERVIEW Q&A
===============================

1. **VPC / VNet**
- AWS: VPC → isolated private network
- Azure: VNet → isolated private network
- Purpose: host resources, define subnets, route tables, gateways

2. **Subnets**
- Divide VPC/VNet into smaller segments
- Public: Accessible from internet
- Private: No direct internet access

3. **Internet Gateway / Public IP**
- AWS: Internet Gateway (IGW) for public subnet
- Azure: Public IP + Route Table provides similar function

4. **NAT Gateway**
- Provides outbound internet for private subnets
- AWS NAT Gateway / Azure NAT Gateway

5. **Load Balancers**
- Distribute traffic, ensure HA & scalability
- AWS: 
  - ALB → Layer 7 (HTTP/HTTPS), WAF support
  - NLB → Layer 4 (TCP/UDP), high throughput
- Azure:
  - Application Gateway → L7, WAF, web apps
  - Azure Load Balancer → L4, TCP/UDP, high performance

6. **Security**
- AWS: Security Groups (stateful) + NACL (stateless)
- Azure: NSG (stateful) + optional Azure Firewall

7. **Availability / High Availability**
- Azure Availability Set → Fault Domains + Update Domains (protects VMs in one data center)
- AWS Multi-AZ / ASG → distribute EC2 across Availability Zones

8. **Auto Scaling**
- AWS ASG → scale EC2 based on metrics
- Azure VM Scale Set → scale VMs based on metrics
- Works with load balancers and health checks

9. **VPC / VNet Peering**
- Connect two isolated networks privately
- AWS: VPC Peering
- Azure: VNet Peering

10. **Routing & Route Tables**
- Public subnet → IGW / Public IP
- Private subnet → NAT Gateway
- Controls where traffic flows

11. **Traffic Flow Example**
- Client → Internet → Load Balancer → Public Web VM → Private App/DB VM → NAT Gateway → Internet (for updates)

12. **OSI Model**
- 7 Layers:
  1. Physical → Cables, hardware
  2. Data Link → MAC addresses, switches
  3. Network → IP addresses, routing
  4. Transport → TCP/UDP, ports
  5. Session → Sessions, connections
  6. Presentation → Encryption, formatting
  7. Application → HTTP, FTP, DNS, SMTP

13. **TCP/IP Model**
- 4 Layers:
  1. Network Interface → Physical + Data Link
  2. Internet → IP routing
  3. Transport → TCP/UDP
  4. Application → HTTP, DNS, FTP, SMTP

14. **MAC Address vs IP Address**
- MAC: Hardware address, Layer 2, unique per NIC
- IP: Logical address, Layer 3, identifies device on network

15. **Stateful vs Stateless**
- Stateful: SG / NSG → return traffic automatically allowed
- Stateless: NACL → inbound/outbound rules defined separately

16. **Health Checks**
- Ensures only healthy VMs receive traffic
- Used by Load Balancers (AWS & Azure)

17. **Public vs Private Subnet**
- Public: Has route to Internet Gateway / public IP
- Private: No direct internet, uses NAT Gateway for outbound

18. **Firewall & Security**
- AWS: SG (stateful) + NACL (stateless)
- Azure: NSG (stateful) + optional Azure Firewall

19. **High Availability / Redundancy**
- Azure: Availability Set / Availability Zones
- AWS: Multi-AZ deployments, ASG across AZs

20. **Scaling & Auto Healing**
- ASG / VMSS monitors metrics and adjusts instance count
- Unhealthy instances automatically replaced

21. **NAT Gateway vs Application Gateway**
- NAT Gateway: Outbound internet only, Layer 3/4
- Application Gateway: L7, HTTP/HTTPS routing, WAF

22. **Load Balancer Types**
- AWS:
  - ALB → L7, web apps, WAF
  - NLB → L4, TCP/UDP, static IPs
- Azure:
  - Application Gateway → L7, web apps, WAF
  - Azure Load Balancer → L4, TCP/UDP

23. **Availability Set / VM Scale Set**
- Azure Availability Set → protects VMs in single data center
- Azure VMSS → automatic scaling like AWS ASG
- AWS Multi-AZ ASG → spreads instances across zones for HA

24. **VPC / VNet Peering**
- Private network connection between isolated networks
- AWS: VPC Peering
- Azure: VNet Peering

25. **Routing / Traffic Flow**
- Client → Internet → Load Balancer → Public Subnet VM → Private Subnet VM → NAT Gateway → Internet (for updates)
- Route Tables control exact paths

26. **Common Interview Questions & Answers**

Q1: Difference ALB vs NLB  
- ALB: Layer 7, HTTP/HTTPS, supports path-based routing, WAF  
- NLB: Layer 4, TCP/UDP, high throughput, static IP, ultra-low latency

Q2: When to use NAT Gateway vs Application Gateway?  
- NAT Gateway: Private VMs need outbound internet access  
- Application Gateway: Web apps needing L7 routing, WAF

Q3: NSG vs NACL  
- NSG: Stateful firewall, applied to subnet/VM  
- NACL: Stateless firewall, applied at subnet level

Q4: How to achieve High Availability in Azure vs AWS?  
- Azure: Use Availability Set / Availability Zones + VMSS  
- AWS: Multi-AZ deployments, Auto Scaling Group

Q5: Explain traffic flow from client to private VM  
- Client → Internet → Load Balancer → Public VM → Private VM → NAT Gateway → Internet (for updates)

Q6: Difference between public and private subnets  
- Public: Direct access from internet, route to IGW  
- Private: No direct internet, uses NAT Gateway for outbound

Q7: Layer 4 vs Layer 7 load balancer  
- L4: TCP/UDP, fast, low latency → NLB / Azure LB  
- L7: HTTP/HTTPS, routing, WAF → ALB / App Gateway

Q8: Fault Domain vs Update Domain  
- Fault Domain: Protects against hardware failure  
- Update Domain: Protects against planned maintenance  

Q9: How NAT Gateway works  
- Routes outbound traffic from private subnet to internet without exposing private IPs  

Q10: How do Security Groups / NSG work?  
- They are stateful → return traffic automatically allowed  
- Control inbound/outbound rules per VM/subnet

===============================
End of Networking Q&A Cheat Sheet





