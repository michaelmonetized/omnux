# STATUS — research umbrella / empty checkouts

**State:** docs + submodule wiring. **Not** a complete shippable distro tree in a shallow clone.

| Path | Reality without `--recurse-submodules` |
| --- | --- |
| `linux/` | Empty directory (submodule to `michaelmonetized/linux` `omnux` branch). |
| `m1n1/` | Empty directory (submodule). |
| `installer/` | Empty directory (submodule → asahi-installer). |
| `pkgs/` | Empty directory (submodule). |
| `gpu/` | Empty directory (submodule → `omnux-gpu`, itself research-only). |
| `docs/` | Present — GOAL / ROADMAP / PROGRESS / STEERING. |
| `pages/` | Referenced in README; may be absent from this checkout. |

## Honest claims

- README status table (M1/M2 daily-drivable, M3 experimental) describes **intent and sibling project state**, not code that lives as source inside this umbrella without initializing submodules.
- Empty component directories are **not** abandoned product code — they are submodule mount points. Clone with `git clone --recurse-submodules` (or `git submodule update --init --recursive`) before treating layout as incomplete engineering.
- GPU work is research-only; see `michaelmonetized/omnux-gpu` `STATUS.md`.

## Why this file exists

Content-factory gap audit flagged `scaffold_only` / empty src-equivalent paths. This demotion makes the empty dirs explicit rather than implying missing product code.

Updated: 2026-09-09 (ET).
