#!/bin/bash

echo "[*] Starting BPFDoor Detach Cleanup"

# Define list of malicious cgroups and program IDs
declare -A BPF_ENTRIES=(
    ["/sys/fs/cgroup/system.slice/snap.canonical-livepatch.canonical-livepatchd.service"]=43
    ["/sys/fs/cgroup/system.slice/snap.cups.cupsd.service"]=44
    ["/sys/fs/cgroup/user.slice/user-1000.slice/user@1000.service/app.slice/snap.snapd-desktop-integration.snapd-desktop-integration.service"]=56
    ["/sys/fs/cgroup/user.slice/user-1000.slice/user@1000.service/app.slice/snap.chromium.chromium-be7c8318-9447-4035-a14d-0e3e4e930bb3.scope"]=734
    ["/sys/fs/cgroup/user.slice/user-1000.slice/user@1000.service/app.slice/snap.firefox.firefox-d4210ef4-d20a-4d91-8b0f-fe027f5fbd60.scope"]=1183
)

# Loop through and detach each malicious BPF program
for CGROUP_PATH in "${!BPF_ENTRIES[@]}"; do
    PROG_ID=${BPF_ENTRIES[$CGROUP_PATH]}
    
    echo "[*] Detaching BPF program ID ${PROG_ID} from ${CGROUP_PATH} ..."
    
    sudo bpftool cgroup detach "$CGROUP_PATH" device id "$PROG_ID"
    
    if [ $? -eq 0 ]; then
        echo "[+] Successfully detached BPF program ID ${PROG_ID}"
    else
        echo "[!] Failed to detach BPF program ID ${PROG_ID}"
    fi
done

echo "[*] Cleanup Completed."
