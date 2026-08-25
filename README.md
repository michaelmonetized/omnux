# OMNUX

**Linux on Apple silicon, shipped with conviction, no holds barred. The fire of Omarchy on the foundation of Asahi.**

Omnux is an integration-first distribution for Apple Silicon Macs. We take the
reverse-engineering miracle that is Asahi Linux and ship its frontier — every
public enablement patch, merged and packaged the day it exists — with
Omarchy-class polish as the target experience.

Landing page: https://michaelmonetized.github.io/asahi-installer/

## Install (M1/M2 today, M3 experimental)

From macOS or recoveryOS:

    curl -fsSL https://raw.githubusercontent.com/michaelmonetized/asahi-installer/omnux/scripts/bootstrap-omnux.sh | sh

## Monorepo layout

This repository is the umbrella: docs, steering, tooling, and component wiring.
Heavyweight code lives in focused components, pinned here by submodule:

| Component | Path | What it is |
| --- | --- | --- |
| Kernel integration branch | [`linux/`](linux) | Asahi kernel + unmerged M3/M4 patches, `omnux` branch |
| m1n1 boot stack | [`m1n1/`](m1n1) | Boot loader + 7-PR M3/M4 bring-up stack, `omnux` branch |
| Installer | [`installer/`](installer) | Omnux-branded installer, curl bootstrap, local release pipeline |
| Distro packages | [`pkgs/`](pkgs) | PKGBUILDs incl. `linux-omnux`, `omnux` branch |
| GPU driver attempt | [`gpu/`](gpu) | MIT clean-room M3 GPU project |
| Landing page source | [`pages/`](pages) | GitHub Pages site |

Clone everything:

    git clone --recurse-submodules https://github.com/michaelmonetized/omnux.git

## The docs

- [GOAL](docs/GOAL.md) — the north star and its definition of done
- [ROADMAP](docs/ROADMAP.md) — milestones from "installs" to "everything working"
- [STEERING](docs/STEERING.md) — non-negotiable principles
- [SUPPORT MATRIX](https://github.com/michaelmonetized/asahi-installer/blob/main/SUPPORT.md) — per-machine truth

## Status snapshot (August 2026)

| Generation | State |
| --- | --- |
| M1 / M2 | Daily-drivable, full acceleration |
| M3 | Experimental install live; GPU/display drivers are the frontier |
| M4 | Bring-up integrated ahead of upstream; needs hardware ADT dumps |
| M5 | Nothing public exists anywhere yet; we integrate the moment it does |

## License

MIT where we wrote it (see component LICENSEs). We carry GPL where the
upstream works we integrate demand it, and everything flows back upstream first.
