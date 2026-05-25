# PACOTE TECNICO ULTRA V6.0.1 by MrCanatto

**Complete toolkit for IT technicians** — Windows repair, cleanup, optimization, and activation.

Developed to simplify the daily workflow of computer repair shops and IT professionals.

## How to Use

1. Download the file `PACOTE TECNICO ULTRA V6.0.1 by MrCanatto.bat`
2. Right-click the file and select **"Run as administrator"**
3. The program will automatically request elevated privileges if it is not already running as Administrator.
4. Choose the desired option from the menu and wait for the process to finish.
5. Most functions will generate a log file on your **Desktop**.

> **Recommendation:** Always run the script as Administrator to ensure all functions work correctly.

---

## Usage Warnings (Important — Please Read)

* This script performs powerful cleanup and system modification operations. Use it with **caution**.
* It is recommended to create a **System Restore Point** before using heavy cleanup options.
* Close all important applications before running **Complete Cleanup and Optimization**.
* The activation option ([0]) downloads and executes code directly from the internet. Use it at your own risk.
* Some functions may take several minutes to complete (especially DISM).
* Do not interrupt the script while it is running.

---

## Main Menu

| Option | Name                                  | Description                             |
| ------ | ------------------------------------- | --------------------------------------- |
| **0**  | **Win & Office Magic Activation**     | Automatic Windows and Office activation |
| **1**  | **Quick Internet/Browser Repair**     | Fast network and browser repair         |
| **2**  | **Complete Cleanup and Optimization** | Deep system cleanup                     |
| **3**  | **Repair Printers**                   | Basic printer repair                    |
| **4**  | **Repair Printers ULTRA**             | Advanced printer repair                 |
| **5**  | **Repair Audio**                      | Fix sound-related problems              |
| **6**  | **Repair Windows Files (SFC)**        | Scan and repair Windows system files    |
| **7**  | **Repair Windows Image (DISM)**       | Repair the Windows image                |
| **8**  | **Open Technical Tools**              | Shortcuts to native Windows tools       |
| **9**  | **Exit**                              | Closes the program                      |

---

## Function Details

### **[0] Win & Office Magic Activation**

Launches the automatic Windows and Office activation script (HWID/KMS) in the background.

### **[1] Quick Internet/Browser Repair**

* Closes browsers and lightweight applications.
* Repairs network settings (flushdns, winsock reset, etc.).
* Applies Cloudflare DNS (1.1.1.1 and 1.0.0.1).
* Clears browser cache (Chrome, Edge, Firefox, Opera, Brave, Vivaldi).
* Cleans Chromium history, temporary files, prefetch, and recycle bin.
* Generates a log file on the Desktop.

### **[2] Complete Cleanup and Optimization**

* Closes heavy applications.
* Performs a full cleanup of temporary files, Windows caches, thumbnails, icons, and logs.
* Cleans Windows Update files.
* Executes **DISM Cleanup**.
* Empties the Recycle Bin.
* Saves system and process information.

### **[3] Repair Printers**

* Stops the Print Spooler service.
* Clears the print queue and spooler cache.
* Restarts related services.
* Fast and simple printer repair.

### **[4] Repair Printers ULTRA**

* Advanced PowerShell-based repair.
* Lists installed printers and their status.
* Performs deep spool folder cleanup.
* Restarts multiple related services.
* Generates a detailed technical log file.

### **[5] Repair Audio**

* Restarts audio services (Audiosrv and AudioEndpointBuilder).
* Cleans audio-related registry settings.
* Opens the Windows sound settings panel.

### **[6] Repair Windows Files (SFC)**

Runs the native command:

```cmd
sfc /scannow
```

### **[7] Repair Windows Image (DISM)**

Runs:

```cmd
DISM /Online /Cleanup-Image /RestoreHealth
```

### **[8] Open Technical Tools**

Quick access to:

* MSConfig
* Task Manager
* Services
* Device Manager
* And other native Windows tools

---

## Important Notes

* Option **[1]** preserves **static IP, subnet mask, and gateway settings** (skips the `netsh int ip reset` command).
* Option **[2]** performs heavier cleanup operations and executes **DISM Cleanup** (which may take a long time).
* Some routines require a **system reboot** to fully complete repairs.
* Chromium history cleanup removes the `History` file; it does not directly remove passwords, but it may affect browsing history data.
* The **DISM Cleanup** process (inside option 2) may take a very long time depending on the condition of the Windows installation.

---

## Requirements

* Windows 10 or 11
* Must be run as **Administrator**
* Internet connection required (for activation and some repair functions)

---

## Author

Developed and designed by **TEC. Mr.Canatto**, with support from Artificial Intelligence applied to Batch Script development and architecture.
