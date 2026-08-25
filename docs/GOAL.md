# GOAL — the north star

## One sentence

A person walks into an Apple Store, buys an M3 MacBook, and walks out running
Omnux — Omarchy's Hyprland desktop on Asahi's foundation — with **everything
working**, installed without a single manual step.

## Definition of done for M3 ("everything working")

The goal is done when every line below is true on every shipping M3 machine
(MacBook Air/Pro 13/14/15/16, iMac), verified by an automated checklist:

1. **Install**: from recoveryOS or macOS with one command; from a USB stick
   where the platform allows it (see Platform Truth below).
2. **Boot**: m1n1 → U-Boot → Omnux kernel boots reliably, no serial console
   required.
3. **Display**: proper DCP driver — native resolution, correct mode setting,
   backlight control, external displays over USB-C/HDMI.
4. **GPU acceleration**: hardware-accelerated OpenGL/Vulkan via the omnux-gpu
   driver; Hyprland runs at 60Hz+ on battery without melting the fans.
5. **Power**: sleep/suspend/resume works; battery life within shouting
   distance of macOS.
6. **Input**: keyboard, trackpad (incl. haptics), TouchID-as-auth if the SEP
   work ever lands upstream.
7. **Connectivity**: WiFi, Bluetooth, Thunderbolt/USB-C including DP alt-mode,
   HDMI out where the machine has it.
8. **Audio**: speakers with speaker-safety protection, mics, headset jack.
9. **Desktop**: `omnux-desktop-mac` meta package delivers the Omarchy
   experience tuned for Macs (keybindings, function keys, power profiles).
10. **Recovery**: a bootable USB stick that can rescue/repair an install.

## Platform Truth (read before promising anyone anything)

Apple Silicon Macs do not boot PC-style ISOs from cold. The signed boot chain
(iBoot → stub partition → m1n1) means the *first* install on internal storage
runs from macOS or recoveryOS. A USB stick becomes bootable **after** Linux is
installed (U-Boot on external drives), which makes sticks perfect for rescue,
reinstall, and offline payload — and means "install from raw via USB" depends
on the direct-USB-boot work landing upstream. We track that work; we do not
pretend it exists.

Therefore the north star decomposes into two shippable realities:

- **Today's path**: blank M3 → recoveryOS → one curl command → experimental
  Omnux (console-grade until GPU/display drivers land).
- **The finished path**: everything above in Definition of Done, plus a USB
  image that installs/rescues wherever the boot chain permits.

Both are tracked in the ROADMAP with acceptance criteria. Neither is faked.

## What this goal explicitly excludes

- Promises about M4/M5 dates. They are blocked on physical-world reverse
  engineering that nobody has done yet. We integrate the moment that changes.
- Forking for ego. Every patch we carry goes upstream first; our branches only
  hold what hasn't merged yet.
