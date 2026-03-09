# HashiCorp Vault Interview Questions and Answers

## 1. What is HashiCorp Vault and why is it used?
HashiCorp Vault is an open-source tool for securely storing, managing, and controlling access to secrets such as API keys, passwords, certificates, and encryption keys.  
It provides encryption as a service, dynamic secrets, and access control, allowing teams to reduce secret sprawl and improve security compliance.  
Vault ensures that secrets are centrally managed, auditable, and rotated automatically when needed.

---

## 2. How do you install Vault?
Vault can be installed on different operating systems using native binaries:  

- **Linux/macOS:** Download the Vault binary from HashiCorp’s official website, extract it, and place it in a system path.  
- **Windows:** Use the downloadable ZIP from HashiCorp or package managers like Chocolatey.  
- Verify the installation by checking Vault’s version to ensure it runs correctly.  
- Vault does not require a complex installation; it is a single binary that can run in development or production modes.

---

## 3. How do you start Vault?
Vault can be started in **development mode** for testing or **server mode** for production:

- **Development Mode:** Vault runs as a single instance with an in-memory backend and provides a root token for easy testing. This mode is **not secure** and is meant only for experiments.  
- **Server/Production Mode:** Vault uses a configuration file defining storage backend, listener (network interface), and other parameters. Multiple instances can be run for High Availability using a shared backend like Consul or Integrated Storage (Raft).  

Vault will listen on a configured port and provide an API endpoint for clients and applications.

---

## 4. How do you initialize and unseal Vault?
- **Initialization:** Vault generates the root token and unseal keys using Shamir’s Secret Sharing. This splits the unseal key into multiple shares so no single person can access the vault.  
- **Unsealing:** A predefined number of unseal keys are required to unseal Vault and make it operational. Each key is applied sequentially to unlock the vault.  
- **Login:** After unsealing, the root token or a derived token is used to log in and configure Vault for users, applications, and secrets.

---

## 5. How do you configure Vault?
Vault configuration includes several components:

- **Storage backend:** Defines where Vault persists secrets (file system, Consul, AWS S3, etc.)  
- **Listener:** Defines the network interface for Vault API access. In production, TLS should always be enabled.  
- **Policies:** Define fine-grained access control for secrets and operations.  
- **Authentication methods:** Enable secure authentication for users or applications, such as AppRole, LDAP, or Kubernetes.  

Configuration files are typically written in HCL format and passed to Vault when starting the server.

---

## 6. How do you enable a secrets engine?
Vault supports multiple secrets engines. For example, a Key-Value (KV) secrets engine:  

- Enable the KV engine to store arbitrary secrets at a defined path.  
- Write secrets to Vault using a key-value structure, such as storing application usernames and passwords.  
- Secrets can be read back when needed, and access is controlled via policies.

Vault also supports **dynamic secrets** like database credentials or cloud API keys that are generated on demand and automatically expire.

---

## 7. How do you handle authentication in Vault?
Vault supports multiple authentication methods:

- **Token-based authentication:** Simple method using root or service tokens.  
- **AppRole authentication:** Common for applications; uses role IDs and secret IDs.  
- **External authentication:** LDAP, GitHub, Kubernetes, and cloud IAM systems.  

Each authentication method allows Vault to identify the client and enforce policies based on roles and permissions.

---

## 8. What are policies in Vault?
Policies are access control rules written in HCL that define **who can do what** inside Vault.  

- Policies specify paths, operations (read, write, list, delete), and allowed capabilities.  
- They are applied to users, applications, or roles to enforce **least privilege access**.  
- Policies are critical to secure Vault in production environments, ensuring secrets are only accessible to authorized entities.

---

## 9. How do you rotate secrets in Vault?
Vault supports secret rotation through **dynamic secrets**:

- For dynamic credentials (like databases), Vault generates secrets on-demand with a time-to-live (TTL).  
- Vault automatically revokes or expires secrets after the TTL.  
- Static secrets can be rotated manually or via automation.  
- Applications fetch secrets at runtime and do not store them permanently, reducing the risk of leaks.

---

## 10. How do you secure Vault communication?
- Always enable **TLS** for Vault listeners in production.  
- Enable **audit logging** to track every access to Vault.  
- Apply strict **policies** and minimal privilege principles to all users and applications.  
- For sensitive keys, consider integrating Vault with a **Hardware Security Module (HSM)**.

---

## 11. Real-time interview scenario questions

**Q1: How do you store and retrieve secrets in Vault?**  
A1: Enable a KV secrets engine and write secrets at a specified path. Applications or users can read secrets dynamically when needed, avoiding hardcoded credentials. Policies control access and enforce least privilege.

**Q2: How do you provide dynamic database credentials to an application?**  
A2: Enable the database secrets engine and configure a role with creation statements and TTL. Vault generates temporary database users for the application, which expire automatically, ensuring improved security.

**Q3: How do you unseal Vault in production?**  
A3: Distribute unseal keys to trusted operators. Each operator applies their key sequentially until Vault is unsealed. Typically, a threshold of keys (e.g., 3 of 5) is required to unlock Vault securely.

**Q4: How do you manage Vault in HA mode?**  
A4: Use a backend like Consul or Integrated Storage (Raft). Multiple Vault instances run and communicate with the backend to synchronize state. Only the leader handles writes, while followers can serve reads.

**Q5: How do you rotate or revoke secrets?**  
A5: Vault automatically expires dynamic secrets based on TTL. Static secrets can be manually updated or revoked. Leases and revocation APIs ensure secrets are rotated securely without downtime.

**Q6: How do you handle secret access for applications securely?**  
A6: Use AppRole authentication with minimal privileges. Applications authenticate using role ID and secret ID to retrieve secrets dynamically. This avoids hardcoding credentials and ensures secrets are short-lived.

---

## 12. Vault Best Practices
1. Always use dynamic secrets wherever possible to reduce exposure.  
2. Enable audit logging for traceability and compliance.  
3. Apply the principle of **least privilege** in policies.  
4. Run Vault with TLS in production for encrypted communication.  
5. Use HA backend for high availability and fault tolerance.  
6. Avoid storing secrets permanently in applications; fetch them dynamically.

---
