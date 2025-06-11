# 🕵️‍♂️ Files Summary

This section documents all artifacts and output files collected during the system investigation and system remediation process.

Each file was generated as part of the **Investigation**, covering persistence mechanisms, active connections, process forensics, kernel rootkit validation, malware traceout etc.

---

## 📁 Network & Connection Statistics

- **Netstat.txt**  
  → Captured raw active connection statistics (`netstat`) to identify suspicious ports or IP sessions during early investigation.

- **another_networkstat_with_pid.txt**  
  → Network connections with associated PIDs (`netstat -antp` or `ss -pant`) to correlate processes with open ports.

- **ss_atnp.txt**  
  → Output of `ss -atnp` to reveal all TCP sockets and their process bindings, used for backdoor tracing.

- **lsof_i_n_P.txt**  
  → Lists all open network-related files using `lsof -i -n -P` to correlate live connections to file descriptors.

- **network_details.txt**  
  → Network interface details and IP configuration used to confirm system exposure.

- **anydesk_pid_trace.txt**  
  → Traces specific process IDs linked to suspicious AnyDesk sessions possibly leveraged post-compromise.

---

## 🔍 Process & Persistence Artifacts

- **processes.txt**  
  → Full system process listing snapshot (`ps aux`) at the time of investigation.

- **processes_with_timestamp.txt**  
  → Same as above but includes timestamp to trace process execution timeline.

- **crontab_persistance_check.txt**  
  → Crontab analysis to reveal hidden persistence vectors used by malware/rootkit.

- **userlist.txt**  
  → Snapshot of system users to confirm unauthorized user presence (e.g., `jenkins`).

---

## 🧬 Malware & Rootkit Trace Evidence

- **poolmine_backdoor_recheck.txt**  
  → Contains indicators and evidence of pool mining malware behavior (e.g., C2 IPs, mining process).

- **poolmin_backdoor_recheck_2.txt**  
  → Continuation of above recheck with more detailed behavioral analysis or PID tracking.

- **Malcheck_3.txt**  
  → Final phase of malware binary check results using tools like `clamscan`, hash matching, or IOC validation.

- **traceout_files_dropped_by_malware.txt**  
  → Tracks files created by the malware or dropped during execution (used for IOC extraction).

- **suspicious_direcorty_Files.txt**  
  → Lists unusual files/folders (e.g., in `/tmp`, `/dev/shm`, `/etc/init.d`) suspected to be part of the malware dropper/persistence.

- **files_with_time_from_devshm.txt**  
  → Timestamped files from `/dev/shm` used by Mumblehard-like malware for stealth execution.

---

## 🧰 Kernel & Rootkit Validation

- **kernelcheck_for_rootkit_fix.txt**  
  → Kernel validation or error logs while removing or reinitializing tainted modules or rootkits.

- **rootkit_check_via_chkrootkit.txt**  
  → Output from `chkrootkit` to detect well-known Linux rootkits or backdoor traces.

- **rootkit_check_via_rkhunter.txt**  
  → Output from `rkhunter`, including rootkit signatures, file permission anomalies, and hidden process checks.

---

## ⚙️ System Tool Scripts

- **detach_bfdoor.sh**  
  → Custom bash script used to detect and detach eBPF-based BPFDoor rootkit from the kernel (`bpftool prog detach`).

- **postfix_function_app_check.txt**  
  → Package/application listing to check for any modification or compromise in `postfix` or similar communication-layer packages.

---
