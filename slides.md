# KISEC Final Project Presentation
<!-- .slide: data-state="slide-config" -->

Note:
Welcome to the KISEC Final Project presentation. This covers our comprehensive security assessment and SIEM implementation.

---

# Future
<!-- .slide: data-background-gradient="linear-gradient(45deg, #1e3c72, #2a5298)" -->

Note:
The future of cybersecurity lies in proactive, intelligent monitoring systems that can adapt and respond to emerging threats in real-time.

---

# SIEM Architecture Flow
<!-- .element: class="r-fit-text" -->

<div class="architecture-diagram">
  <div class="arch-node fragment" data-fragment-index="1">
    <div class="node-box">User Devices</div>
  </div>
  <div class="arch-arrow fragment" data-fragment-index="1">↓</div>
  
  <div class="arch-node fragment" data-fragment-index="2">
    <div class="node-box">Sysmon /<br/>Auditd Logs</div>
  </div>
  <div class="arch-arrow fragment" data-fragment-index="2">↓</div>
  
  <div class="arch-node fragment" data-fragment-index="3">
    <div class="node-box">Wazuh Agent<br/>(Log Collection &<br/>Local Rule Matching)</div>
  </div>
  <div class="arch-arrow fragment" data-fragment-index="3">↓</div>
  
  <div class="arch-node fragment" data-fragment-index="4">
    <div class="node-box">Wazuh Manager<br/>(Ruleset, Alerts, etc.)</div>
  </div>
  <div class="arch-arrow fragment" data-fragment-index="4">↓</div>
  
  <div class="arch-node fragment" data-fragment-index="5">
    <div class="node-box">OpenSearch Stack<br/>(Log Indexing & Search)</div>
  </div>
  <div class="arch-arrow fragment" data-fragment-index="5">↓</div>
  
  <div class="arch-node fragment" data-fragment-index="6">
    <div class="node-box">Python Parser Layer<br/>(Normalize JSON Alerts)</div>
  </div>
  <div class="arch-arrow fragment" data-fragment-index="6">↓</div>
  
  <div class="arch-split fragment" data-fragment-index="7">
    <div class="arch-branch">
      <div class="node-box">TinyLLaMA</div>
    </div>
    <div class="arch-branch">
      <div class="node-box">MiniGPT-4</div>
    </div>
  </div>
  <div class="arch-arrow fragment" data-fragment-index="7">↓</div>
  
  <div class="arch-node fragment" data-fragment-index="8">
    <div class="node-box">n8n Workflow<br/>(Alert Routing)</div>
  </div>
  <div class="arch-arrow fragment" data-fragment-index="8">↓</div>
  
  <div class="arch-node fragment" data-fragment-index="9">
    <div class="node-box">RASA NLU<br/>(Intent +<br/>context)</div>
  </div>
  <div class="arch-arrow fragment" data-fragment-index="9">↓</div>
  
  <div class="arch-node fragment" data-fragment-index="10">
    <div class="node-box">TheHive / Cortex<br/>- Alert creation<br/>- Analyzer suggestions<br/>- Responder integration</div>
  </div>
  <div class="arch-arrow fragment" data-fragment-index="10">↓</div>
  
  <div class="arch-node fragment" data-fragment-index="11">
    <div class="node-box">SOC Analyst Dashboard</div>
  </div>
</div>

Note:
This diagram shows our complete SIEM architecture flow, from user devices all the way down to the SOC analyst dashboard. Each component will animate in sequence as we click through, showing the data flow from collection to analysis to response.

---

# Presence Before and After
Identity is not a login — it's a shadow that moves with the user

Note:
We often ask who is trying to access the system — but rarely when, from where, and in what state. Identity doesn't appear at login; it lingers in the environment before the user speaks. This is a prelude — where presence is felt, not yet proven. A ripple in the fabric of the system.

---

# Environment
The quiet context: IP, hardware, entropy — all whisper who you are

Note:
The machine doesn't care about names. It notices voltages, entropy, keystroke rhythms, IPs that drift with the wind. These are the silent fingerprints of our presence. Trust isn't just about secrets — it's about consistency in context.

---

# Forms Nowhere, Now Everywhere
Authentication without asking — the body speaks before the mouth

Note:
The old model asked us to prove ourselves — but now, the proof is already here. Location speaks, device speaks, behavior speaks. The system reads the room before we enter it. Authentication becomes ambient, invisible, continuous.

---

# Signals
A capsule signed by reality, decoded by trust

Note:
All these signals — the capsule — are bundled into a signed whisper. The system listens not to what we say, but to what we are. It's the rhythm of our typing, the signature of our WiFi, the pattern of our movements through cyberspace.

---

# Superposition of Presence
You exist, and don't — until the system observes your trace

Note:
In quantum mechanics, particles don't have states until observed. Our system borrows this metaphor: Until we unwrap the capsule, the user is both present and not. Observation — verification — collapses uncertainty into trust.

---

# Trust Begins Where the Wire Ends
No perimeter, no gateway — only confidence in the origin of motion

Note:
Perimeters have dissolved. There are no more walls, only waves. Trust must now travel with the entity. Not at the door, but at every interface. And that trust is built — not with secrets — but with context, with consistency, with time.

---

# Security Assessment Results
<!-- .slide: data-background-color="#2c3e50" -->

## Key Findings

- **Vulnerabilities Detected**: 15 Critical, 32 High Priority
- **Malware Artifacts**: Mumblehard Miner, BPFDoor Rootkit
- **Compromised Systems**: 3 Endpoints, 1 Server
- **Response Time**: 4.2 hours average detection to containment

Note:
Our comprehensive security assessment revealed several critical vulnerabilities that required immediate attention. The malware analysis uncovered sophisticated threats that had been operating undetected.

---

# Incident Response Timeline
<!-- .slide: data-background-gradient="linear-gradient(45deg, #c0392b, #8e44ad)" -->

<div class="timeline-container">
  <div class="timeline-item fragment">
    <h3>Initial Detection</h3>
    <p>Unusual network traffic patterns identified</p>
    <span class="timestamp">00:00</span>
  </div>
  
  <div class="timeline-item fragment">
    <h3>Analysis & Containment</h3>
    <p>Malware signatures matched, systems isolated</p>
    <span class="timestamp">01:30</span>
  </div>
  
  <div class="timeline-item fragment">
    <h3>Eradication</h3>
    <p>Rootkit removal and system hardening</p>
    <span class="timestamp">03:45</span>
  </div>
  
  <div class="timeline-item fragment">
    <h3>Recovery & Monitoring</h3>
    <p>Systems restored with enhanced monitoring</p>
    <span class="timestamp">04:15</span>
  </div>
</div>

Note:
The incident response followed our established playbook, with each phase carefully documented and timed for continuous improvement of our processes.

---

#### THE END
<!-- .slide: data-background-gradient="linear-gradient(45deg, #2c3e50, #34495e)" -->

### Thank You for Your Attention

<div class="contact-info">
  <p>KISEC Final Project Team</p>
  <p>Security Assessment & SIEM Implementation</p>
  <p>📧 Contact: team@kisec.security</p>
</div>

Note:
Thank you for joining us for this presentation. We're happy to answer any questions about our security assessment methodology, SIEM implementation, or incident response procedures.
