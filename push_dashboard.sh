#!/bin/bash
AGENT_DIR="/root/Coinbase-Agent-Jun2026"
DASH_DIR="/root/coinbase-agent-dashboard"

cp "$AGENT_DIR/market_snapshot.json"   "$DASH_DIR/data/market_snapshot.json"
cp "$AGENT_DIR/regime_snapshot.json"   "$DASH_DIR/data/regime_snapshot.json"
cp "$AGENT_DIR/paper_trades.json"      "$DASH_DIR/data/paper_trades.json"
cp "$AGENT_DIR/performance_stats.json" "$DASH_DIR/data/performance_stats.json"

cd "$DASH_DIR"
git add data/
git commit -m "agent cycle: $(date '+%Y-%m-%d %H:%M')" --quiet
git push origin main --quiet

echo "Dashboard pushed to GitHub"
