# 🤖 Azure DevOps Self-Hosted Agent Automation Script

This project provides a fully automated **Bash script** to install, configure, and run a self-hosted agent for Azure DevOps on a Linux machine.

---

## 🚀 What This Script Does

- Installs required dependencies (`wget`, `tar`)
- Downloads the Azure DevOps agent binary
- Extracts and configures the agent using a Personal Access Token (PAT)
- Automatically registers the agent to your DevOps organization and starts it

---

## 🧰 Prerequisites

- Linux VM or machine (Ubuntu/Debian recommended)
- Azure DevOps Organization
- Personal Access Token (PAT) with at least:
  - Agent Pools (Read & Manage)
  - Deployment Group (if using deployment agents)
- Bash shell

---

## ⚙️ How to Use

### 1. Clone this repository or copy the script

```bash
git clone https://github.com/karimtamboli07/Az-self-host-agnet-Automate.git
cd Az-self-host-agnet-Automate
```

### 2. Update `setup-agent.sh`

Edit and set these variables in the script:

```bash
ORG_URL="https://dev.azure.com/YOUR_ORG_NAME"
AGENT_POOL="your-agent-pool"
AGENT_NAME="my-selfhosted-agent"
PAT="YOUR_PERSONAL_ACCESS_TOKEN"
```

> 💡 Never expose your PAT in a public repo!

---

### 3. Run the Script

```bash
chmod +x setup-agent.sh
./setup-agent.sh
```

---

## 📂 Directory Structure

```bash
az-agent-automate/
├── setup-agent.sh         # Main automation script
└── agent/                 # Agent will be downloaded and extracted here
```

---

## 🛠 Script Logic Summary

| Step | Description                               |
|------|-------------------------------------------|
| 1    | Install dependencies                      |
| 2    | Download Azure DevOps agent tarball       |
| 3    | Extract agent files                       |
| 4    | Remove previous configuration if any      |
| 5    | Register agent to Azure DevOps via PAT    |
| 6    | Start the agent                           |

---

## 🛡️ Security Best Practices

- Do **NOT** commit the script with your PAT.
- Use environment variables or secure vaults to store secrets.
- Rotate your PATs regularly.
- Consider switching to Service Principal authentication for enterprise use.

---

## 👨‍💻 Author

**Karim Tamboli**  
🔗 [GitHub Profile](https://github.com/karimtamboli07)

---

## 📌 Bonus (To-Do Ideas)

- [ ] Create systemd service to run agent as background daemon
- [ ] Add support for Docker-based agents
- [ ] Helm chart for Kubernetes deployment
