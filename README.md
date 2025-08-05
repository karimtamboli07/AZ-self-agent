# Az‑Self‑Host‑Agent‑Automate

**Automate Azure DevOps self‑hosted agent deployment and configuration**

---

## 🚀 Project Overview
This project simplifies and automates the setup of Azure DevOps self‑hosted agents—via VM or Kubernetes—for CI/CD workflows. Ideal for teams requiring control, customization, or scale beyond Microsoft-hosted agents.

---

## 🔧 Tech Stack & Tools
- Azure CLI / PowerShell
- Terraform or ARM Templates (if used)
- Kubernetes (optional) + Helm (when deploying agents in Kubernetes clusters)
- Docker / Containerization (for containerized runners)
- Scripted automation (Bash, PowerShell, etc.)
- Integration with Azure Pipelines (agent pools & PAT/SPN)

---

## 📦 Installation & Setup

### Prerequisites:
- Azure subscription & Azure DevOps organization
- Azure CLI & Azure DevOps CLI extension
- Terraform (optional, if infrastructure as code used)
- Personal Access Token (PAT) or Service Principal credentials
- Kubernetes cluster (optional, if deploying agents using k8s)

### Step‑by‑Step Guide:
1. Clone the repository:
   ```bash
   git clone https://github.com/karimtamboli07/Az-self-host-agnet-Automate.git
   cd Az-self-host-agnet-Automate
   ```
2. Authenticate Azure & DevOps:
   ```bash
   az login
   az devops login --organization https://dev.azure.com/YourOrg
   ```
3. (Optional) Deploy infrastructure via Terraform or ARM templates:
   ```bash
   az group create –‑name <rg> –‑location <region>
   terraform init
   terraform apply
   ```
4. Run automation script to register agent:
   ```bash
   ./setup-agent.sh     # or PowerShell script
   ```
   Provide:
   - Azure DevOps organization URL
   - Agent pool name
   - PAT or SPN credentials
   - (Optional) Kubernetes or container config
5. Verify agent registration in Azure DevOps portal under your agent pool.

---

## 🌟 Features
- Automated provisioning of VMs or containers for agents  
- Support for both PAT and Service Principal authentication  
- Optionally deploy agent pods with Helm charts on Kubernetes  
- Scalable CI/CD agent infrastructure for production usage  
- Best practices for security and token rotation

---

## 🧪 Usage Examples

**Running agent setup:**
```bash
./setup-agent.sh \
  --org https://dev.azure.com/MyOrg \
  --pool my-pool \
  --token <YOUR_PAT> \
  --k8s-enabled true
```

**Helm example (for Kubernetes agents):**
```bash
helm install az-agents ./charts/az-selfhosted-agents \
  --set linux.enabled=true \
  --set windows.enabled=false \
  --set dind.enabled=false \
  --namespace az-agent
```

---

## 🔒 Security & Best Practices
- Rotate PATs regularly or use Azure SPN + AAD & Service Principal  
- Restrict agent VM access to required users only  
- For Kubernetes pods: use least-permission RBAC policies  
- Keep agent runner software updated to latest stable version

---

## 🎓 Demo / Documentation
*Add your blog post, video tutorial, or official docs link here if available.*

---

## 🙋 Author & Contributors
- **Karim Tamboli**  
  GitHub: [karimtamboli07](https://github.com/karimtamboli07)

Feel free to contribute via Issues or PRs—enhancements, bug fixes or additions of other agent types are welcome!

---

## 📄 License
Specify your license here (e.g., MIT, Apache‑2.0).

---

## 📌 Quick Reference Table

| Step | Description                                     |
|------|-------------------------------------------------|
| 1    | Clone the repo                                  |
| 2    | Authenticate with Azure & DevOps CLI            |
| 3    | (Optional) Deploy infra via Terraform/ARM       |
| 4    | Run agent registration automation script        |
| 5    | (If Kubernetes) Use Helm chart to deploy pods   |
| 6    | Verify agents are successfully added to pool     |
