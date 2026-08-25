# The M3 GPU is the last wall between Mac owners and a real Linux desktop. Here is our siege plan.

*Omnux — the fire of Omarchy on the foundation of Asahi.*
*Draft for X, 2026-08-25. Filed alongside the blocker map: https://github.com/michaelmonetized/omnux/issues/1*

---

**Where we are.** An M3 Mac today boots Omarchy MX Mac end to end: Apple's iBoot hands off to m1n1, U-Boot takes over, and Linux comes up with NVMe, WiFi, Bluetooth, keyboard, trackpad, and speakers working. You can install it right now from recoveryOS with one command. The desktop runs. It just runs like it's 1998 — because every pixel is software-rendered while we reverse-engineer Apple's newest GPU.

**What "done" means.** Native display modesetting through Apple's DCP. Hardware-accelerated OpenGL and Vulkan via an MIT-licensed clean-room driver that Asahi can take wholesale. Hyprland at 60Hz+ on battery without melting the fans. Not a demo. A daily driver.

**The three walls**, and none of them fall from a distance:

1. **The submission model.** How macOS userspace feeds work to the AGX firmware on T603x silicon — queues, doorbells, fault handling. Changed since M2. Unknown.
2. **The shader ISA.** M3 shipped Dynamic Caching, hardware ray tracing, and mesh shaders. The instruction encoding moved. Dougall Johnson's public ISA work gives us a map; we need the terrain.
3. **The firmware interface.** Version negotiation and queue management against shipping macOS 14.x/15.x firmware. Every macOS release is a moving target.

Each of these is only discoverable **against real hardware**, in a trace loop: boot an M3 into m1n1's proxyclient harness, run GPU workloads under instrumentation on macOS, diff captures against the known M1/M2 models, document, implement clean-room from documented behavior only, validate via kexec, publish upstream first. No amount of code written away from the metal substitutes for that loop. This is why every other attempt stalls — not talent, distance from hardware.

**So we're closing the distance.** Starting today, an owner-feedback program for M3 MacBook Air, MacBook Pro, Mac mini, and Mac Studio machines:

- We ship you **one-command diagnostics software** (`omnux-report`) that documents your machine's experience: verbose success/info/warning/error log dumps, performance benchmarks, and full system architecture data — your choice what leaves your machine.
- Your reports become the validation matrix that turns "should work" into "works," and your ADT dumps become the device trees that make bring-up possible at all.
- If you can lend trace-loop access to a machine, you move the entire timeline. That's the bottleneck, full stop.

Every blocker is now a public issue with acceptance criteria — engineering walls in [omnux-gpu](https://github.com/michaelmonetized/omnux-gpu/issues), the owner program in [omnux](https://github.com/michaelmonetized/omnux/issues). No roadmap-speak, no dates on unfinished science. Just named blockers, named owners, and receipts.

M1 and M2 users: you already have the whole fire. M3 owners: pick a wall. Let's go break it.

*[Omnux](https://github.com/michaelmonetized/omnux) · install today: `curl -fsSL https://raw.githubusercontent.com/michaelmonetized/asahi-installer/omnux/scripts/bootstrap-omnux.sh | sh` · truth table before promises: [SUPPORT.md](https://github.com/michaelmonetized/asahi-installer/blob/omnux/SUPPORT.md)*
