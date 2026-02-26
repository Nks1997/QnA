# JFrog Artifactory

## 1. What is JFrog Artifactory?
**Answer:**  
Artifactory is a **universal artifact repository manager** that stores and manages binaries and artifacts for software projects. It supports multiple package types like Maven, Docker, NuGet, npm, etc., and acts as a central source for internal and external dependencies in CI/CD pipelines.

---

## 2. Difference between Local, Remote, and Virtual Repositories
**Answer:**  
- **Local Repository:** Hosted on your Artifactory instance; stores internally built artifacts.  
- **Remote Repository:** Proxies external repositories (e.g., Maven Central, Docker Hub) and caches artifacts locally.  
- **Virtual Repository:** Combines multiple local and remote repositories under a single URL for simpler access and dependency management.

---

## 3. What is AQL (Artifactory Query Language)?
**Answer:**  
AQL is a **JSON-based query language** used to search artifacts, builds, and metadata in Artifactory.  
- Use cases: searching by properties, cleanup of old artifacts, build promotion, reporting.  
- Helps DevOps automate artifact management and maintain organized repositories.

---

## 4. How does Artifactory integrate with a Database?
**Answer:**  
- Artifactory stores **metadata** (artifact info, permissions, users, builds) in a relational database.  
- Standalone installations use **embedded Derby**, but HA requires an **external database** like PostgreSQL or MySQL.  
- External DB ensures **metadata consistency across HA nodes** and allows clustering.

---

## 5. Why is LDAP Authentication used?
**Answer:**  
- Delegates authentication to **LDAP or Active Directory**.  
- Centralizes user management, integrates with enterprise identity systems, supports RBAC, and enables Single Sign-On (SSO).  
- Users are automatically granted Artifactory permissions based on AD groups.

---

## 6. OSS vs Pro Editions
**Answer:**  
- **OSS (Open Source):** Free, limited features; no HA, no Xray scanning, no replication.  
- **Pro / Enterprise:** Paid version; includes HA, Xray integration, replication, advanced security, and SSO support.  
- Identification: check Artifactory UI under Admin → About, or the Docker image name (`artifactory-oss` vs `artifactory-pro`).

---

## 7. Securing Maven Credentials in Pipelines
**Answer:**  
- Never store credentials in pom.xml or committed settings.xml.  
- Use **Azure DevOps secret variable groups** or **Azure Key Vault**.  
- Inject credentials dynamically during the build to generate a temporary settings file or use Artifactory CLI securely.

---

## 8. Default Ports in Artifactory Docker
**Answer:**  
- **8081:** Main Artifactory UI and REST API, used for artifact operations.  
- **8082:** JFrog Access service, handles authentication, SSO, OAuth, and token management.  
- Database connections are internal and not exposed via these ports.

---

## 9. What is Build Promotion?
**Answer:**  
- Process of moving artifacts from a **snapshot repository to a release repository**.  
- Snapshots are unstable; releases are production-ready.  
- Used in CI/CD pipelines to promote validated builds for deployment, ensuring artifact immutability.

---

## 10. What is a Virtual Repository and its use in CI/CD?
**Answer:**  
- A virtual repository aggregates multiple local and remote repositories into **a single URL**.  
- Simplifies CI/CD configuration and automatically resolves dependencies from multiple sources.

---

## 11. What is JFrog Xray?
**Answer:**  
- JFrog Xray is a **security and compliance scanner** that integrates with Artifactory.  
- Scans artifacts for **vulnerabilities, licenses, and compliance issues**.  
- Alerts DevOps teams to potential risks before deployment.

---

## 12. How do you identify if HA setup is required?
**Answer:**  
- When multiple Artifactory nodes are needed to share artifacts and metadata.  
- For high availability, load balancing, and clustering.  
- Requires external database and shared filestore; single-node setups are **not HA**.

---

## 13. Common DevOps use cases for Artifactory
**Answer:**  
- Artifact storage, versioning, and promotion.  
- Proxying external repositories (e.g., Maven Central, npm registry, Docker Hub).  
- Automating cleanup and artifact lifecycle with queries.  
- Integration with CI/CD pipelines for consistent builds.  

---

## 14. How do pipelines interact with Artifactory?
**Answer:**  
- Pipelines fetch and deploy artifacts using repository URLs (local, remote, virtual).  
- Use secure authentication via API keys or service connections.  
- Build tools like Maven, Gradle, NuGet, npm, or Docker interact with Artifactory as a source or target.

---

## 15. How do you perform artifact cleanup?
**Answer:**  
- Search for old or unused artifacts using **AQL or metadata filters**.  
- Automate deletion in pipelines using Artifactory API or CLI.  
- Helps reduce storage usage and keeps repositories organized.

---
 
