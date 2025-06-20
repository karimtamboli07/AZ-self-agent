i#!/bin/bash

ORG_URL="https://dev.azure.com/karimtamboli07gmailcom"
AGENT_POOL="default"
AGENT_NAME="SAM-autogenrate"
PAT="YOUR TOKEN"    #pest your PAT
AGENT_DIR="/home/karim/az-agent-automate"
TAR_URL="https://download.agent.dev.azure.com/agent/4.258.1/vsts-agent-linux-x64-4.258.1.tar.gz"

sudo apt-get update
sudo apt-get install -y wget tar

mkdir -p "$AGENT_DIR"
cd "$AGENT_DIR"

# === Download only if not already downloaded ===
if [ ! -f agent.tar.gz ]; then
  echo "⬇️ Downloading agent package..."
  wget -O agent.tar.gz "$TAR_URL"
else
  echo "✅ agent.tar.gz already exists, skipping download."
fi

# === Extract only if not already extracted ===
if [ ! -f config.sh ]; then
  echo "📦 Extracting agent package..."
  tar zxvf agent.tar.gz
else
  echo "✅ Agent already extracted, skipping extraction."
fi

iiwget -O agent.tar.gz "$TAR_URL"

tar zxvf agent.tar.gz
# === Remove existing config if already configured ===
if [ -f .agent ]; then
  echo "🧹 Removing existing agent configuration..."
  ./config.sh remove
fi
./config.sh --unattended \
	--url "$ORG_URL" \
	--auth pat \
	--token "$PAT" \
	--pool "$AGENT_POOL" \
	--agent "$AGENT_NAME" \
	--acceptTeeEula \
	--replace

./run.sh
