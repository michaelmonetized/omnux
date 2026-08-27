# ROADMAP

Milestones in dependency order. Each has acceptance criteria — a milestone is
done when its criteria pass, not when we feel good about it.

## M0 — Foundation ✅ (August 2026)

- [x] Forks created: kernel, m1n1, installer, PKGBUILDs
- [x] `omnux` integration branches carrying public-but-unmerged work:
  - m1n1: t8132 MCC/NVMe/ATC, SART v3/v4, M4 SMP reservation, DCP 14.8.3 ABI (7 PRs)
  - kernel: M4 ANS2 NVMe port, M3 PMP power management, M4 input DTs,
    DCP suspend fix, USB3 PHY fix
- [x] Installer: Omnux rebrand, three-tier gating, `OMNUX_EXPERIMENTAL` track
- [x] Local release pipeline (no hosted CI); first release published
- [x] curl one-liner bootstrap live
- [x] Landing page + truth table
- [x] omnux-gpu MIT project scaffolded

## M1 — M3 installs are boring  *(next)*

Make the experimental path reliable enough to stop calling it scary.

- [ ] `linux-omnux` package builds reproducibly in local CI on every push
- [ ] Installer completes on all base-M3 machines without expert-mode flags
      beyond `OMNUX_EXPERIMENTAL=1`
- [ ] Post-install: boots to console with WiFi + NVMe + keyboard/trackpad on
      first try; serial-debug guide for the rest
- [ ] Known-issue ledger per machine model, linked from installer output
- **Done when**: five distinct M3 machines install and boot to login.

## M2 — Display that doesn't apologize

- [ ] DCP 14.8.3 ABI driver upstreams or lands in `omnux`: native modesetting
- [ ] Backlight control works
- [ ] External display over USB-C works
- **Done when**: brightness keys change screen brightness; no iBoot
  framebuffer in the boot chain.

## M3-milestone — GPU acceleration (the moonshot)

- [ ] Trace loop running against real hardware (m1n1 proxyclient captures)
- [ ] Command processor submission model documented for T8122/T603x
- [ ] Shader ISA deltas vs M2 documented
- [ ] DRM driver renders accelerated desktop
- **Done when**: Hyprland runs hardware-accelerated at usable frame rates on
  battery. This is the long pole; everything else can lap it.

## M4 — The polish that makes it Omarchy

- [ ] Sleep/suspend/resume validated across machine models
- [ ] speakersafetyd profiles shipped; mic capture works
- [ ] Webcam works
- [ ] Thunderbolt/DP-alt-mode stable
- [ ] `omnux-desktop-mac` meta package: Omarchy configs adapted for Macs
      (function keys, power profiles, battery-aware defaults)
- **Done when**: a daily-driver checklist survives two weeks of real use.

## M5 — USB stick story

- [~] Bootable rescue/reinstall image (U-Boot external-drive boot), dd-able
      — *the [`omarchy-mx-mac-iso`](https://github.com/michaelmonetized/omarchy-mx-mac-iso)
      live image assembles end to end and its installer pipeline is verified
      against loopback disks (plain + LUKS2, 51 assertions,
      [PROGRESS 2026-08-25](PROGRESS.md)); hardware boot test pending*
- [ ] Offline payload mode for airgapped installs via recoveryOS
- [ ] Direct-USB-boot installer image — contingent on upstream's UEFI-from-USB
      work landing; tracked, not promised
- **Done when**: one stick rescues any Omnux Mac and installs offline where
  the platform allows.

## Community milestones (parallel track)

- [x] **TouchID on T1** — @0xBOYD3 confirmed biometric auth on Omarchy,
      first known Linux TouchID implementation (2016-17 TouchBar, T1 chip)
- [ ] TouchID on T2 — Boyd testing next; same Secure Enclave family, hardened
- [ ] TouchID on M-series — contingent on SEP firmware research; no public
      path exists yet. See [SUPPORT.md](../SUPPORT.md#touchid-status) for
      status per chip family.
- [~] **SEP research program** — omnux-gpu #10 tracker; evidence collector
      live in omnux-report (sep/ section); attack-surface doc #11, T2
      bridge #12, upstream coordination #14. M-series = hardened SEP work,
      tracked honestly, not promised.

## Beyond — M4/M5

Blocked on physical-world RE that does not exist yet. Standing order:
the moment any public patch appears for T604x/T8140/T8132 successors, M5,
or M6 (Mac mini M6/M5 Pro and Mac Studio M5 Max/Ultra announced 2026-08-25,
customer availability 2026-09-22 — the earliest possible ADT-dump date),
it lands in an `omnux` branch within days. See GOAL.md for why we don't
put dates on other people's unfinished science.
