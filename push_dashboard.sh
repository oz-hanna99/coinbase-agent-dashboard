#!/bin/bash
# Copies latest agent data to dashboard repo and pushes to GitHub.
# Called automatically at the end of each agent cycle.

AGENT_DIR="$HOME/Coinbase-Agent-Jun2026"
DASH_DIR="$HOME/coinbase-agent-dashboard"

# Copy JSON data files (never copy API keys or credentials)
cp "$AGENT_DIR/market_snapshot.json"   "$DASH_DIR/data/market_snapshot.json"
cp "$AGENT_DIR/regime_snapshot.json"   "$DASH_DIR/data/regime_snapshot.json"
cp "$AGENT_DIR/paper_trades.json"      "$DASH_DIR/data/paper_trades.json"
cp "$AGENT_DIR/performance_stats.json" "$DASH_DIR/data/performance_stats.json"

# Push to GitHub
cd "$DASH_DIR"
git add data/ index.html push_dashboard.sh
git commit -m "agent cycle: $(date '+%Y-%m-%d %H:%M')" --quiet
git push origin main --quiet

echo "Dashboard pushed to GitHub"
