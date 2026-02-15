#!/bin/bash
echo "🔍 Architect Audit in progress..."
if git rev-parse --verify feature-dark-mode >/dev/null 2>&1; then
    echo "✅ [1/3] Feature branch detected."
else
    echo "❌ [1/3] Missing feature-dark-mode branch."
fi

if grep -q "Security Patch" app.py && grep -q "Dark Mode" app.py; then
    echo "✅ [2/3] Conflict Resolved: Both patch and feature exist in app.py."
else
    echo "❌ [2/3] app.py is missing either the patch or the feature."
fi

if [[ $(git log --oneline | wc -l) -ge 4 ]]; then
    echo "✅ [3/3] Version history (logs) are healthy."
else
    echo "❌ [3/3] Version history is too short. Did you commit everything?"
fi