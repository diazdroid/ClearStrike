# ⚡ ClearStrike
**Ultimate 2-Stage Shader Purge & Hardcore E-Sports Optimizer**

ClearStrike is an uncompromising, hardcore system optimizer designed specifically for competitive E-Sports players (CS2, Valorant, Apex Legends). Engineered to bypass the infamous "Safe Mode loops", ClearStrike utilizes a custom **2-Stage Normal Boot Architecture** to aggressively purge locked cache files and inject latency-crushing registry tweaks.

Strictly engineered by **@diazdroid**.

---

## 🚀 Features

* **Advanced 2-Stage Architecture:** Completely bypasses Windows Safe Mode. It suspends NVIDIA subsystems in normal mode to forcibly delete locked DirectX, OpenGL, Compute, and Steam shader caches.
* **Hardcore NVIDIA Tweaks:** Forcibly disables HDCP, enforces the `P0 Power State` (disabling dynamic P-states), and strips out unnecessary telemetry.
* **MSI Mode Injection:** Automatically re-routes hardware interrupts for Display Adapters to Message Signaled Interrupts (MSI) to drastically reduce driver latency.
* **ClearStrike Ultimate Profile:** Injects a custom `.nip` (NVIDIA Profile) setting Shader Cache to "Unlimited", enabling Ultra Low Latency Mode (ULLM), and disabling G-SYNC/V-Sync for raw frametime consistency.
* **Bulletproof Web-Execution:** Built with TLS 1.2 enforcement and granular, millisecond-accurate telemetry logging (`C:\ClearStrike\ClearStrike_Debug.log`).
* **Self-Hosted Dependencies:** Fetches tools directly from the ClearStrike repository to ensure maximum stability and security.

---

## ⚠️ Disclaimer & Warning

**READ BEFORE EXECUTING:** 
ClearStrike is NOT a standard "PC cleaner". It applies deep, kernel-level registry modifications and alters core GPU power states. 
* Your GPU will run at maximum frequencies (P0 State). 
* System will **AUTOMATICALLY REBOOT 2 TIMES** during the process.
* **Use at your own risk.** It is highly recommended to create a System Restore point before execution.

---

## 💻 How to Install & Run

You do not need to download any files manually. ClearStrike is designed for seamless Web-Execution.

1. Right-click on the Start Menu and select **Windows PowerShell (Admin)** or **Terminal (Admin)**.
2. Copy and paste the following command into the console and hit Enter:

```powershell
irm https://raw.githubusercontent.com/diazdroid/ClearStrike/main/ClearStrike.ps1 | iex
