# Investigation Procedures

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
The sysmon_full_config.xml contains aggressive behavioral capture designed for active threat hunting and incident response.

