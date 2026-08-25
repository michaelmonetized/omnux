# We can boot Linux on every M3 Mac. The GPU is the holdout.

*Omnux founder post, draft 2. Unslopped per pstack's unslop skill.*
*Blocker map: https://github.com/michaelmonetized/omnux/issues/1*

---

An M3 MacBook runs our Linux build today. One command from recoveryOS, Apple's installer makes room on the disk, m1n1 hands off to U-Boot, and Linux comes up with the SSD, WiFi, Bluetooth, keyboard, trackpad, and speakers working. The desktop runs too. Software-rendered, which is generous phrasing for how it looks.

That last part is what this post is about.

First, what works, because the Asahi Linux folks earned this list and we inherit it gratefully. Install from recoveryOS in about eight minutes. Native NVMe speed. WiFi and Bluetooth. Keyboard, trackpad, speakers with proper safety limiting. Sleep is broken. Display works through a framebuffer Apple set up before Linux ever started, so you get the panel at one resolution with no backlight control worth trusting. It boots, it installs, it stays up. If you want to try it:

    curl -fsSL https://raw.githubusercontent.com/michaelmonetized/asahi-installer/omnux/scripts/bootstrap-omnux.sh | sh

Now the honest part. "Done" means your M3 renders Hyprland through hardware OpenGL and Vulkan at frame rates you'd expect on battery, through a display driver that owns modesetting and backlight. What stands between here and there is reverse engineering, and I won't pretend otherwise. Three things nobody outside Apple has fully mapped for these chips.

How work gets submitted. macOS userspace talks to a firmware coprocessor that manages the GPU. On M1 and M2 the community mapped its queues and doorbells. M3 changed that protocol, and until someone traces it on real silicon, any driver would be guessing.

What the shaders became. M3 added Dynamic Caching, mesh shaders, and hardware ray tracing. The instruction encoding moved. Dougall Johnson's published ISA research maps much of it, but maps are not terrain. Someone has to compile real shaders, capture what the hardware does, and write down the differences.

What the firmware expects. Version negotiation, queue setup, fault reporting against shipping macOS firmware. Every macOS release moves this target.

All three get solved the same way, and there is no shortcut. Boot an M3 into m1n1's proxyclient harness from a second machine. Run GPU workloads under macOS with instrumentation attached. Diff the captures against what we know about M1 and M2. Write down what changed. Implement from the documentation, clean-room, under an MIT license Asahi can absorb wholesale. Boot it with kexec. Repeat until pixels move fast enough to brag about.

Most attempts at this stall for a boring reason. Not talent. Distance from hardware. So we're removing the distance.

Starting today we run an owner program for M3 machines, all of them: MacBook Air 13 and 15, MacBook Pro 14 and 16, Mac mini, Mac Studio. We ship you one command called omnux-report that collects how your machine actually behaves. Verbose logs at every severity, performance benchmarks, full system architecture data. You choose what leaves your machine, serials and keys scrubbed by default. Your reports turn "should work" into "works" per model. Your ADT dumps become device tree ground truth that bring-up depends on. And if you can lend a machine to the trace loop, even for an afternoon, you shorten this entire project by weeks.

Everything above is now public work with acceptance criteria. Nine engineering blockers in omnux-gpu, eight owner-program issues in the omnux repo, one tracker linking them:

https://github.com/michaelmonetized/omnux/issues/1

I'd love to end with a date. The honest version is that we don't set dates on other people's unfinished science, including ours. What I can promise is that every claim we make will link to a commit, a test result, or a measurement, and anything that stops working gets said out loud in the same place.

M1 and M2 owners, you have the whole thing today. M3 owners, pick an issue. The walls only look load-bearing.

Truth table before promises: https://github.com/michaelmonetized/asahi-installer/blob/omnux/SUPPORT.md
