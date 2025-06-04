# Activities on the Issue Investigation

This document describes the full investigation and monitoring setup performed on the compromised Ubuntu device `172.30.1.94`.

---

## 🔎 Enumeration Phase

### Initial Enumeration Using Nmap

For initial vulnerability assessment, we used **Nmap** with aggressive scanning options:

```bash
nmap -O -sV --script vuln 172.30.1.94
```
This command performs:

    OS detection

    Service version detection

    Basic vulnerability scanning using NSE scripts

Full Scan Command (Deeper Enumeration)

To get complete details including OS info, version info, open ports, and vulnerability detection:
```
sudo nmap -A --osscan-guess --version-all --script vuln 172.30.1.94 -oN full_scan.txt
```

Command Flags Info:

    -A → Aggressive Scan

    --osscan-guess → Helps OS detection even if target partially responds

    --version-all → Probe all version detection methods

    --script vuln → Execute Nmap vulnerability detection NSE scripts (limited coverage)

Scan Metadata:

    Target IP: 172.30.1.94

    Hostname: aiegoo

    Scan Date: June 3, 2025

    Tool: Nmap + Vulners NSE

    Scan Type: Full enumeration

##  Summary of Nmap Result

| Service | Port | Version | Severity | Key Issues |
|---------|------|---------|----------|------------|
| SSH | 22 | OpenSSH 9.6p1 (Ubuntu) | 🚨 Critical | Multiple public RCE exploits, CVE-2024-6387 |
| HTTP | 80 | nginx 1.24.0 | 🔶 High | HTTP/2 DoS (CVE-2023-44487), directory traversal (CVE-2024-7347), multiple exploits |
| HTTPS | 443 | Web Application | 🔶 High | HTTP Verb Tampering vulnerability (Authentication bypass) |
| Samba | 139 | Samba 4.6.2 | 🚨 Critical | Highly exploitable RCEs, CVE-2017-7494, CVE-2023-3961, active exploits available |
| RPCBind | 111 | RPC 2-4 | 🔷 Medium | Exposed internal RPC enumeration, lateral movement risk |
| Apache Legacy | 80 | Legacy Module Detected | 🔷 Low | CVE-2011-3192 (Byte-range DoS vulnerability) |

---

### Monitoring Setup (Sysmon + Wazuh)

Step 1 — Install Sysmon for Linux

We install Sysmon for Linux on the target Ubuntu machine for real-time behavioral monitoring.

    Installation instructions followed from:
    SysmonForLinux GitHub Installation Guide: https://github.com/microsoft/SysmonForLinux/blob/main/INSTALL.md

Step 2 — Apply Sysmon Configuration
```
sudo sysmon -accepteula -i sysmon_full_config.xml
or,
sudo sysmon -c Sysmon_Snippet_This_Machine.xml

```
File Link: https://github.com/aiegoo/siem/tree/32bfeb6496b232605ac82cc4aec5b90a8d9e5de2/Wazuh%20Sysmon%20Package

The sysmon_full_config.xml contains aggressive behavioral capture designed for active threat hunting and incident response.

Step 3 — Install Wazuh into the new install ubuntu on Virtualbox

Install the all-in-one deployment of wazuh SIEM into the newly installed ubuntu machine that is in virtualbox. 
```
curl -sO https://packages.wazuh.com/4.12/wazuh-install.sh && sudo bash ./wazuh-install.sh -a
```

Install wazuh agent. agent command instruction can be found from wazuh dashboard after install it.

Step 4 — Configure Wazuh Agent for Sysmon Log Ingestion

Configure the Wazuh Agent to monitor Sysmon logs from syslog:
```
<localfile>
  <log_format>sysmon</log_format>
  <location>/var/log/syslog</location>
</localfile>
```
or if Sysmon forwards to journalctl:
```
<localfile>
  <log_format>sysmon</log_format>
  <location>journalctl</location>
</localfile>
```

Step 5 — Apply Custom Wazuh Detection Rules

custom Wazuh rules (wazuh_sysmon_rules.xml) to detect.

The rule file was imported into:
```
/var/ossec/etc/rules/local_rules.xml
```
File Link: https://github.com/aiegoo/siem/blob/fcb6184eb48e2445710e2adb66afe030f7e2212d/Wazuh%20Sysmon%20Package/wazuh_sysmon_rules.xml
