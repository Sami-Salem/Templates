#!/bin/bash
exit_code=0
echo "🔍 Architect Audit in progress..."
if git rev-parse --verify feature-dark-mode >/dev/null 2>&1; then
    echo "✅ [1/3] Feature branch detected."
else
    echo "❌ [1/3] Missing feature-dark-mode branch."
    exit_code=1
fi

if grep -q "Security Patch" app.py && grep -q "Dark Mode" app.py; then
    echo "✅ [2/3] Conflict Resolved: Both patch and feature exist in app.py."
else
    echo "❌ [2/3] app.py is missing either the patch or the feature."
    exit_code=1
fi

if [[ $(git log --oneline | wc -l) -ge 4 ]]; then
    echo "✅ [3/3] Version history (logs) are healthy."
else
    echo "❌ [3/3] Version history is too short. Did you commit everything?"
    exit_code=1
fi
if [ $exit_code -eq 0 ]; then
    clear
    echo -e "\033[1;32m"
    echo "  __  __  ___  ____  ____  ___  ___  _   _     "
    echo " |  \/  ||_ _||_  / / ___||_ _||_ _|N | | |    "
    echo " | |\/| | | |  / /  \___ \ | |  | | |  \| |    "
    echo " | |  | | | | / /_   ___) || |  | | | |\  |    "
    echo " |_|  |_||___|____| |____/|___||___||_| \_|    "
    echo "                                               "
    echo "       CODEBASE RESTORED. GOOD JOB.            "
    echo -e "\033[0m"
fi
exit $exit_code