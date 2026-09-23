#!/bin/bash
CB_DIR="/root/Coinbase-Agent-Jun2026"
HL_DIR="/root/Hyperliquid-Agent"
DASH_DIR="/root/coinbase-agent-dashboard"

cp "$CB_DIR/market_snapshot.json"   "$DASH_DIR/data/market_snapshot.json"
cp "$CB_DIR/regime_snapshot.json"   "$DASH_DIR/data/regime_snapshot.json"
cp "$CB_DIR/paper_trades.json"      "$DASH_DIR/data/paper_trades.json"
cp "$CB_DIR/performance_stats.json" "$DASH_DIR/data/performance_stats.json"
cp "$HL_DIR/hl_market_snapshot.json"   "$DASH_DIR/data/hl_market_snapshot.json" 2>/dev/null || true
cp "$HL_DIR/hl_regime_snapshot.json"   "$DASH_DIR/data/hl_regime_snapshot.json" 2>/dev/null || true
cp "$HL_DIR/hl_trades.json"            "$DASH_DIR/data/hl_trades.json" 2>/dev/null || true
cp "$HL_DIR/hl_performance_stats.json" "$DASH_DIR/data/hl_performance_stats.json" 2>/dev/null || true

cd "$DASH_DIR"
git add data/ index.html push_dashboard.sh
git commit -m "dashboard update: $(date '+%Y-%m-%d %H:%M')" --quiet
git push origin main --quiet
echo "Dashboard pushed"
