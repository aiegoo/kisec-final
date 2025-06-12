<!-- .slide: data-state="slide-config" -->
<!--
revealOptions:
  slideNumber: true
  transition: fade
-->

# Host Compromise Investigation

---

## 📋 Executive Summary

- Chromium Snap package vulnerability exploitation led to malicious payload delivery
- Pre-existing Jenkins user account hijacked for establishing persistence
- Mumblehard malware deployed to `/dev/shm/duet` targeting c3pool.org
- BPFDoor rootkit implanted for kernel-level persistence and backdoor access

---

## 💻 Compromised System Details

- Ubuntu 24.04.2 LTS Noble
- Kernel Version: 6.11.0
- Compromised User: Jenkins
- CVEs Identified: 3

---

## ⏱️ Attack Chain Timeline

1. Chromium Snap vulnerability exploited to drop malicious loader
2. Jenkins user account hijacked as execution context
3. Mumblehard Miner & BPFDoor backdoor installed via scheduled tasks
4. Cron job created for continuous mining operations
5. BPFDoor rootkit + data exfiltration to mining pool
6. AnyDesk credentials compromised for remote access

---

## 🦠 Malware Artifacts Discovered

- Mumblehard Miner: Crypto mining malware (**HIGH IMPACT**)
- BPFDoor Rootkit: Kernel-level backdoor (**STEALTH**)
- Malicious Cron Job:
  ```
  * * * * * /usr/bin/flock -n /var/tmp/verl.lock -c 'cd /dev/shm/duet; exec ./app ...'
  ```
- Rootkit Detection Evidence:
  ```
  /proc/1656590/stack:[<0>] unix_seqpacket_recvmsg+0x43/0x70
  ```

---

## 🕵️ BPFDoor Rootkit Analysis

- Detection Method: Kernel stack analysis revealing `unix_seqpacket_recvmsg` hooks
- Technology: eBPF-based kernel module for stealth operations
- eBPF Programs Identified:
  ```
  2039: cgroup_skb  name sd_fw_ingress  tag 6deef7357e7b4530  gpl
  2040: cgroup_device  name sd_devices  tag c8b47a902f1cc68b  gpl
  ```

---

## 🔬 Forensic Investigation Methodology

- Vulnerability assessment protocols
- Malware detection and analysis techniques
- Rootkit identification methodologies
- System integrity verification processes

---

## 🛡️ Comprehensive Remediation

- Mumblehard miner binaries purged
- BPFDoor rootkit completely removed
- All malicious cron jobs deleted
- Jenkins user activities cleared

---

## 🎓 Key Lessons Learned

- Snap-based applications represent significant attack surfaces
- Kernel-level eBPF-based rootkits are increasing in Linux environments
- Scheduled cron jobs remain highly effective persistence mechanisms

---

## 🚀 Future Security Recommendations

- Complete clean OS installation with data backup
- Enable system-wide application confinement
- Reduce Snap package usage
- Establish automated kernel update monitoring

---

## 📚 Investigation Documentation

- [GitHub Wiki](https://github.com/aiegoo/siem): Comprehensive investigation architecture and methodology

---

## ✅ Investigation Complete

- 100% Malware Removed
- 0 Active Threats
- Full System Integrity
- 24/7 SIEM Monitoring

---

# Presence Before and After
Identity is not a login — it's a shadow that moves with the user
Note:
We often ask who is trying to access the system — but rarely when, from where, and in what state...

---

# Environment
The quiet context: IP, hardware, entropy — all whisper who you are
Note:
The machine doesn’t care about names. It notices voltages, entropy, keystroke rhythms...

---

# Forms Nowhere, Now Everywhere
Authentication without asking — the body speaks before the mouth
Note:
The old model asked us to prove ourselves — but now, the proof is already here...

---

# Signals
A capsule signed by reality, decoded by trust
Note:
All these signals — the capsule — are bundled into a signed whisper. The system listens...

---

# Superposition of Presence
You exist, and don’t — until the system observes your trace
Note:
In quantum mechanics, particles don’t have states until observed. Our system borrows this metaphor...

---

# Trust Begins Where the Wire Ends
No perimeter, no gateway — only confidence in the origin of motion
Note:
Perimeters have dissolved. There are no more walls, only waves. Trust must now travel with the entity...

---

<!-- Section Breaker GIF -->
<div style="text-align:center;">
  <img src="assets/breaker.gif" alt="Section Breaker" style="max-width:70%;"/>
</div>

---

