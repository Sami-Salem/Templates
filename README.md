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

