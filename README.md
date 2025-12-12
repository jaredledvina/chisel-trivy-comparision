# Ubuntu Vanilla vs Chiseled Container Comparison

> Comparing vulnerability scan results between vanilla Ubuntu Jammy and chiseled Ubuntu images with Trivy

## 📊 Latest Scan Results

**Version:** `v0.0.9`
**Scanned:** $(date -u '+%Y-%m-%d %H:%M UTC')
**Workflow:** [View Run](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404)

---

## 🔍 Three-Way Vulnerability Comparison

### Progression Overview

```
Vanilla Ubuntu          Chiseled (Bare)         Chiseled + dpkg
(Full Base)        →    (Minimal Base)     →    (With Metadata)
════════════            ════════════            ════════════
   27 CVEs       ↓ 25 (-92.5%)       2 CVEs      ↑ 10 (+500.0%)      12 CVEs
```

### Detailed Breakdown by Severity

<table>
<tr>
  <th>Severity</th>
  <th>Vanilla</th>
  <th>→ Chiseled</th>
  <th>Change</th>
  <th>→ Chiseled+dpkg</th>
  <th>Change</th>
</tr>
<tr><td>🔴 <strong>Critical</strong></td><td align="center">0</td><td align="center">0</td><td align="center">N/A</td><td align="center">0</td><td align="center">N/A</td></tr>
<tr><td>🟠 <strong>High</strong></td><td align="center">0</td><td align="center">1</td><td align="center">N/A</td><td align="center">1</td><td align="center">→ 0</td></tr>
<tr><td>🟡 <strong>Medium</strong></td><td align="center">5</td><td align="center">1</td><td align="center">↓ 4 (-80.0%)</td><td align="center">2</td><td align="center">↑ 1 (+100.0%)</td></tr>
<tr><td>🔵 <strong>Low</strong></td><td align="center">22</td><td align="center">0</td><td align="center">↓ 22 (-100.0%)</td><td align="center">9</td><td align="center">N/A</td></tr>
<tr><td><strong>TOTAL</strong></td><td align="center"><strong>27</strong></td><td align="center"><strong>2</strong></td><td align="center"><strong>↓ 25 (-92.5%)</strong></td><td align="center"><strong>12</strong></td><td align="center"><strong>↑ 10 (+500.0%)</strong></td></tr>
</table>


### 📈 Key Insights

#### Vanilla → Chiseled (Bare Base)
- **Total Reduction:** ↓ 15 (-55.5%) vulnerabilities removed
- **Attack Surface:** Minimal bare base eliminates unnecessary packages
- **Trade-off:** Some vulnerabilities harder to detect without package metadata

#### Chiseled → Chiseled + dpkg status
- **Visibility Change:** ↑ 10 (+500.0%)
- **Detection:** Adding dpkg metadata allows Trivy to identify installed packages
- **Recommendation:** Include dpkg status for production vulnerability scanning


---

## 🐳 Container Images

All images are available in GitHub Container Registry:

| Image Type | Tag | Pull Command |
|------------|-----|--------------|
| **Vanilla** | `v0.0.9` | `docker pull ghcr.io/jaredledvina/chisel-trivy-comparision-vanilla:v0.0.9` |
| **Chiseled (Bare)** | `v0.0.9` | `docker pull ghcr.io/jaredledvina/chisel-trivy-comparision-chiseled:v0.0.9` |
| **Chiseled + dpkg** | `v0.0.9` | `docker pull ghcr.io/jaredledvina/chisel-trivy-comparision-chiseled-dpkg:v0.0.9` |

---

## 📦 Download Scan Results

Access detailed Trivy scan reports from the [latest workflow run](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404):

- **Vanilla Image:** [JSON](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404) | [Table](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404) | [SARIF](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404)
- **Chiseled Image:** [JSON](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404) | [Table](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404) | [SARIF](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404)
- **Chiseled + dpkg:** [JSON](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404) | [Table](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404) | [SARIF](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404)
- **Comparison Report:** [Full Report](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404)

---

## 🏗️ Repository Structure

```
chisel-trivy-comparision/
├── vanilla/
│   └── Dockerfile                 # Standard Ubuntu Jammy + dnsutils
├── rockcraft-bare/
│   └── rockcraft.yaml            # Minimal bare base (no dpkg metadata)
└── rockcraft-dpkg/
    └── rockcraft.yaml            # Bare base + dpkg status file
```

---

## 💡 About This Comparison

This project demonstrates the security and size benefits of **chiseled Ubuntu images** (minimal, distroless-like containers) compared to traditional Ubuntu base images.

### What are Chiseled Images?

Chiseled Ubuntu images use:
- **Bare base:** No OS bloat, no package manager, no shell
- **Minimal dependencies:** Only required files from packages
- **Reduced attack surface:** Fewer binaries = fewer vulnerabilities

### Why Test With/Without dpkg Metadata?

- **Without dpkg status:** Smaller image, but vulnerability scanners can't detect all installed packages
- **With dpkg status:** Slightly larger, but enables accurate vulnerability detection for compliance

### Key Takeaways

1. **Security:** Chiseled images significantly reduce CVE exposure
2. **Size:** Bare base images are dramatically smaller than full Ubuntu
3. **Scanning:** For production use, include dpkg metadata for compliance scanning
4. **Trade-offs:** Balance between minimal size and vulnerability visibility

---

<div align="center">

**Last Updated:** $(date -u '+%Y-%m-%d %H:%M:%S UTC')
**Generated by:** [GitHub Actions](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20154623404)

</div>
