Mission: Git Rescue | مهمة إنقاذ الكود

Welcome, Architect. You have been recruited to fix a failing codebase. You will work entirely in the terminal to restore order.
أهلاً بك يا مهندس. تم استدعاؤك لإصلاح كود برمجي متعطل. ستعمل بالكامل داخل الـ Terminal لاستعادة النظام.



📜 The Scenario | السيناريو

1. **Initial State:** The project has one stable file (`app.py`).
2. **Task 1:** Create a new feature (Dark Mode) on a separate branch.
3. **Task 2:** A critical security bug is found in the `main` branch. You must switch back and fix it immediately.
4. **Task 3:** Merge your feature into the fixed main branch. **Watch out for conflicts!**

---

## 🛠️ Execution Steps | خطوات التنفيذ

### **1. Setup | التأسيس**

Configure your identity so Git knows who is saving the world:

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

```

### **2. Start the Mission | ابدأ المهمة**

Initialize the repo and create the first "Stable" version:

```bash
git init
echo "print('System Online')" > app.py
git add app.py
git commit -m "feat: initial stable system"

```

### **3. The "Dark Mode" Branch | فرع الوضع الليلي**

Marketing wants Dark Mode. Create a branch and add the code:

```bash
git checkout -b feature-dark-mode
echo "print('Dark Mode: Active')" >> app.py
git add .
git commit -m "feat: add dark mode"

```

### **4. The Emergency Hotfix | إصلاح طارئ**

A bug was found in `main`! Switch back and patch it:

```bash
git checkout main
echo "print('Security Patch Applied')" >> app.py
git commit -am "fix: patch critical security leak"

```

### **5. The Final Merge | الدمج النهائي**

Now, combine the Dark Mode with the patched system:

```bash
git merge feature-dark-mode

```

**Attention:** You will see a **MERGE CONFLICT**. Open `app.py`, resolve it manually to keep both the Security Patch and the Dark Mode, then commit.*

---

## 🏁 Validation | التحقق من الحل

Run the provided audit script to see if you succeeded:

```bash
chmod +x validate.sh
./validate.sh

```

---

### **Step 2: The Validation Script (`validate.sh`)**

*Create a file named `validate.sh` in the repo root. This allows students to self-correct.*

```bash
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

```

---
**Step 3: The Environment Config (`.devcontainer/devcontainer.json`)**

*Create a folder `.devcontainer` and put this file inside. It ensures the terminal opens automatically.*

```json
{
    "name": "Git Master Lab",
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/devcontainers/features/common-utils:2": {}
    },
    "customizations": {
        "codespaces": {
            "openFiles": ["README.md"]
        }
    },
    "postCreateCommand": "chmod +x validate.sh"
}

```


1. Create a repo with these files on your GitHub.
2. In **Settings**, check **"Template repository"**.
3. Send them the link.
4. Tell them: **"Click 'Use this template' -> 'Open in Codespaces'."**

This keeps the work in **their** account, away from your repos, and provides a full terminal even if they are using a mobile phone browser.
