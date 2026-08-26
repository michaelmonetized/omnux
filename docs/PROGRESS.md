# Progress log

Dated entries, newest first. One bullet per shipped change; every claim
links to its receipt (STEERING #8).

## 2026-08-26

**omnux-report v0.1.0 built and validated** ([omnux-report `aac9244`](https://github.com/michaelmonetized/omnux-report/commit/aac9244),
closes the tooling half of [omnux#2](https://github.com/michaelmonetized/omnux/issues/2)).
Severity-complete logs with a 50 MiB cap, architecture data, opt-in tagged
benchmarks, ADT helper, consent + default redaction (addresses scrubbed at
collection so log timestamps survive; secrets matched only as key=value).
Receipts: complete bundle on real hardware (MacBook Pro 16-inch M1 Pro,
Omarchy) and a 10-check synthetic-sysroot fixture test. Still open from #2:
live-image packaging, GPU benchmark paths on machines that have those tools,
release asset.

## 2026-08-25 (later)

**M3 GPU blocker map filed — 17 public issues.** Engineering walls in
[omnux-gpu](https://github.com/michaelmonetized/omnux-gpu/issues) (#1 trace
harness … #9 clean-room audit); owner program here (#1 tracker, #2
`omnux-report` v0 diagnostics bundle, #3 cohort recruitment, #4 ADT dumps,
#5 boot validation matrix, #6 benchmark corpus, #7 sleep telemetry, #8
display evidence sweep). Founder announcement drafted:
[announcements/2026-08-25-m3-gpu-siege-plan.md](announcements/2026-08-25-m3-gpu-siege-plan.md).

## 2026-08-25

**New silicon announced — truth updated everywhere.** Mac mini M6/M5 Pro and
Mac Studio M5 Max/Ultra announced today, customer availability September 22.
No public enablement exists for any of them. Installer bootstrap gate now
catches M6 explicitly instead of "not a supported machine", support matrix
gains rows for the whole lineup, and this repo's status snapshot + standing
order note September 22 as the earliest realistic ADT-dump date.
Receipts: [installer gate `5c7fda7`](https://github.com/michaelmonetized/asahi-installer/commit/5c7fda7)
(omnux branch), matrix rows in the same commit.

**Omarchy MX Mac live installer: S4 complete in code.**
The [`omarchy-mx-mac-iso`](https://github.com/michaelmonetized/omarchy-mx-mac-iso)
builder (upstream `yannouuuu`, forked for receipts) now ships a working disk
pipeline behind the live TUI:

- Target discovery (unpartitioned space on Apple-provisioned internal disks,
  whole-disk external), full dry-run plan preview, typed target confirmation.
  ([`0bcc6b4`](https://github.com/michaelmonetized/omarchy-mx-mac-iso/commit/0bcc6b4))
- Partitioning only inside verified free space; Apple type GUIDs refused by
  suffix; created partitions rolled back on failure. Optional LUKS2 with
  pbkdf2 for GRUB; payload dd; fresh UUID via `btrfstune`; resize;
  personalization (fstab/crypttab/locale/keymap/user+wheel/sudoers/sddm
  seed/resolved); read-only `@factory` snapshot.
- **Critical fix found during rehearsal:** the staged root shipped ALARM's
  stock initramfs config — no `asahi` hook, so every installed system would
  boot without WiFi/GPU firmware. An authoritative drop-in now sets
  `HOOKS=(base asahi udev …)` and the kernel preset is generated from the
  mkinitcpio template at install time.
- Standalone GRUB written to the existing ESP behind an `omarchy-installed`
  marker so stick and installed ESP never fight. LUKS2 unlock wired to the
  real LUKS UUID; AES arrives as `gcry_rijndael` (there is no `gcry_aes.mod`).
- Builder fixes: ALARM mirror fallback (round-robin serves stale 404s),
  Linux aarch64 host detection, portable checksum sidecars, `pkgs/`
  override seam for `linux-omnux`/`m1n1` integration packages on M3-class
  machines. ([`f75cffb`](https://github.com/michaelmonetized/omarchy-mx-mac-iso/commit/f75cffb))

Receipts (STEERING #8): 13 unit assertions +
[`install-pipeline-e2e.sh`](https://github.com/michaelmonetized/omarchy-mx-mac-iso/blob/main/test/integration/install-pipeline-e2e.sh)
51 assertions across plain and LUKS2 loopback rehearsals — GPT entries
byte-identical, `m1n1/boot.bin` untouched outside `EFI/BOOT` + `grub/`,
cryptomount on the real LUKS UUID, `@factory` read-only. Artifacts build
green natively on an Arch ARM aarch64 host: live image 5.9 GiB apparent /
4.3 GiB allocated.

**Still open:** hardware USB boot test after a UEFI-only provision (the S4
gate); building `linux-omnux`/`m1n1` packages for the `pkgs/` seam; then the
M3 definition-of-done checklist resumes at ROADMAP M1/M2.
