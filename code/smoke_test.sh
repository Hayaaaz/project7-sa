#!/bin/bash

set -e

echo "Running smoke test..."

# 1. Check app health
echo "Checking /health endpoint..."
curl -s http://localhost:8000/health || { echo "Health check failed"; exit 1; }

#2. Perform inference
echo "Performing inference..."
curl -s -X POST http://localhost:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{"model":"llama3.2:1b","messages":[{"role":"user","content":"Smoke test"}]}' \
  || { echo "Inference failed"; exit 1; }

echo "Smoke test passed!"
