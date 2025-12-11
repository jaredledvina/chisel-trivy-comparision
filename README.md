# Chisel vs Trivy Comparison

This repository compares vulnerability scan results between vanilla Ubuntu Jammy and chiseled Ubuntu Jammy images using Trivy.

## Latest Scan Results

**Tag:** `v0.0.8`
**Run:** [View Workflow Run](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20121224282)

## Summary

| Image | Critical | High | Medium | Low | Total |
|-------|----------|------|--------|-----|-------|
| Vanilla Ubuntu Jammy | 0 | 0 | 5 | 22 | 27 |
| Chiseled (Bare Base) | 0 | 1 | 1 | 0 | 2 |

## Key Observations

### Vanilla vs Chiseled (Bare Base)
- **Critical vulnerabilities reduced:** 0
- **High vulnerabilities reduced:** -1
- **Total vulnerabilities reduced:** 25
- **Percentage reduction:** 92.5%

### Chiseled (Bare Base) vs Chiseled + dpkg status
- **Critical vulnerabilities difference:** 0
- **High vulnerabilities difference:** 0
- **Total vulnerabilities difference:** 10

> **Note:** The dpkg status file allows Trivy to detect installed packages and their vulnerabilities more accurately.

---

## Vanilla Image Vulnerability Summary

```
{

## Artifacts

Download detailed scan results from the latest workflow run:

- [Vanilla Image Scan Results](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20121224282)
- [Chiseled Image Scan Results](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20121224282)
- [Chiseled + dpkg status Scan Results](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20121224282)
- [Full Comparison Report](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20121224282)

## Container Images

The following images are available in GitHub Container Registry:

- `ghcr.io/jaredledvina/chisel-trivy-comparision-vanilla:v0.0.8`
- `ghcr.io/jaredledvina/chisel-trivy-comparision-chiseled:v0.0.8`
- `ghcr.io/jaredledvina/chisel-trivy-comparision-chiseled-dpkg:v0.0.8`

## Repository Structure

```
chisel-trivy-comparision/
├── vanilla/
│   └── Dockerfile                      # Vanilla Ubuntu Jammy
├── rockcraft-bare/
│   └── rockcraft.yaml                  # Chiseled (bare base)
└── rockcraft-dpkg/
    └── rockcraft.yaml                  # Chiseled + dpkg status
```

## About

This comparison demonstrates the security benefits of using chiseled Ubuntu images (minimal, distroless-like containers) versus traditional Ubuntu base images.

**Key Findings:**
- Vanilla Ubuntu has fewer vulnerabilities initially but includes a much larger attack surface
- Chiseled images dramatically reduce the number of installed packages
- Adding dpkg metadata improves Trivy's vulnerability detection accuracy

---

*Last updated: $(date -u '+%Y-%m-%d %H:%M:%S UTC') by [GitHub Actions](https://github.com/jaredledvina/chisel-trivy-comparision/actions/runs/20121224282)*
