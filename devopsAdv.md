## 1. Azure DevOps Repos

**Q1: What is Azure Repos and how does it differ from GitHub or Bitbucket?**  
Azure Repos provides unlimited private Git repositories with deep integration into Azure DevOps services. Unlike GitHub, which is broader in collaboration features, Azure Repos is designed for end-to-end DevOps pipelines with built-in policies, branch protections, and integration with Azure Pipelines and Boards.

**Q2: How do you implement branching strategies in Azure Repos?**  
Common strategies include GitFlow, Feature Branching, Trunk-Based Development, or Release Branching. Branch policies enforce code reviews, required builds, and automated checks. Using protected branches ensures that only reviewed and validated code gets merged.

**Q3: How is permission handled in Azure Repos?**  
Permissions are managed at repository, branch, and project levels. Users can have roles like Contributor, Reader, or Admin, and branch policies can enforce approval workflows. Fine-grained permissions ensure security without blocking collaboration.

**Q4: How do you handle large files in Azure Repos?**  
For large files, Azure DevOps supports **Git LFS (Large File Storage)**. This avoids repository bloat by storing large binaries externally while maintaining references in the repo.

**Q5: Real-time scenario:**  
A developer accidentally pushes a secret key to a repo. How would you mitigate and prevent this?  
Immediate action includes revoking the exposed key, rotating it, and using **Azure DevOps branch policies** with **pre-commit hooks** or **GitSecrets** to prevent secrets from being pushed in the future.

---

## 2. Azure Pipelines (CI/CD)

**Q1: Explain the difference between YAML pipelines and Classic pipelines.**  
YAML pipelines are code-defined, versioned alongside the repo, and support multi-stage, parameterized CI/CD. Classic pipelines are GUI-based, easier for simple workflows, but less flexible and harder to version-control.

**Q2: How do you implement multi-stage CI/CD pipelines?**  
Use YAML pipelines with defined stages (Build, Test, Deploy). Each stage can run in different environments, with approvals, gates, or manual interventions. This provides clear separation between CI and CD and ensures traceability.

**Q3: How do you handle secrets and environment variables in pipelines?**  
Use **Pipeline Variables**, **Variable Groups**, and integrate **Azure Key Vault**. Secrets are encrypted and never exposed in logs. Managed identities or service connections securely pass credentials to pipelines.

**Q4: What are service connections and how are they used?**  
Service connections allow Azure DevOps to authenticate with external services like Azure, Kubernetes, Docker Registry, or GitHub. They provide secure, reusable credentials for pipeline deployments and resource access.

**Q5: Real-time scenario:**  
You need to deploy a microservices application to AKS using CI/CD, with zero downtime. How do you design the pipeline?  
Implement a **multi-stage YAML pipeline**:  
- Build container images → Push to Azure Container Registry  
- Deploy to AKS using **Helm** with **canary or blue-green strategy**  
- Include approval gates and health checks before promoting to production  
- Monitor using Application Insights integration.

---

## 3. Pipeline Permissions and Approvals

**Q1: How are permissions managed for pipelines?**  
Pipeline permissions are controlled by **project-level roles** and pipeline-specific roles (Run pipeline, Edit pipeline, Approve). **Environments** can enforce approvals, checks, and access restrictions for deployment.

**Q2: How do you enforce approvals before deployment?**  
Use **Environment approvals and checks**. Specify approvers for pre-deployment, post-deployment gates, or quality checks. Pipelines will pause until approvals are granted, ensuring control over production changes.

**Q3: How do you secure build artifacts?**  
Use **Azure Artifacts** with feed-level permissions. Artifacts can be scoped to specific teams or pipelines. Additionally, enforce retention policies and signing mechanisms to prevent unauthorized modifications.

**Q4: Real-time scenario:**  
Multiple teams deploy to the same environment. How do you ensure one pipeline does not overwrite another team’s deployment?  
Use **Environment approvals**, **exclusive locks**, and **separate namespaces in AKS or Azure App Service slots**. Pipeline triggers and gating strategies prevent race conditions and accidental overrides.

---

## 4. Azure Boards and Work Item Integration

**Q1: How do you integrate Boards with Pipelines?**  
Link **Work Items** to commits, pull requests, and pipeline runs. This provides traceability from code changes to requirements and allows automated updates (e.g., closing a bug once the PR is merged).

**Q2: How do you implement automated release notes?**  
Use pipeline tasks to generate release notes from linked work items and commits. Tools like **Generate Release Notes extension** in Azure DevOps automate changelogs for stakeholders.

**Q3: Real-time scenario:**  
You need to ensure compliance tracking of feature delivery. How is this implemented?  
Use **Work Item policies**, enforce linking of commits/PRs to tasks, and generate pipeline reports for completed work items. This ensures audit-ready traceability.

---

## 5. Advanced Azure DevOps Scenarios

**Q1: How do you implement CI/CD for multi-repo projects?**  
Use **multi-repo triggers** in YAML pipelines, repository resources, and artifact sharing. Centralize shared components as artifacts and orchestrate builds using multi-stage pipelines.

**Q2: How do you manage pipeline dependencies across environments?**  
Use **pipeline triggers**, **artifact dependencies**, and **staged approvals**. For example, a Build pipeline produces artifacts consumed by Test and Deploy pipelines in sequence.

**Q3: How do you implement rollback strategies in Azure DevOps?**  
Maintain versioned artifacts, container images, or ARM templates. Implement **blue-green** or **canary deployment** strategies and pipeline tasks to redeploy previous stable versions if issues occur.

**Q4: How do you monitor pipeline performance and failures?**  
Use **pipeline analytics** and **logs** to track build/test times, failure rates, and flakiness. Integrate with Azure Monitor or Application Insights for advanced observability.

**Q5: Real-time scenario:**  
A deployment fails halfway in production. How do you handle this?  
- Abort the failed deployment  
- Analyze logs for root cause  
- Rollback using previous artifact/version  
- Apply **pipeline gates** and retries  
- Update documentation and alerts for future prevention.

---

