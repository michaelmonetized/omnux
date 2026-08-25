# We can boot Linux on every M3 Mac. The GPU is the holdout.

*Omnux founder post, draft 3. Unslopped per pstack's unslop skill.*
*Blocker map: https://github.com/michaelmonetized/omnux/issues/1*

---

An M3 MacBook runs our Linux build today. One command from recoveryOS, Apple's installer makes room on the disk, m1n1 hands off to U-Boot, and Linux comes up with the SSD, WiFi, Bluetooth, keyboard, trackpad, and speakers working.

What works today comes from Asahi Linux. Install takes about eight minutes. NVMe runs at native speed. WiFi and Bluetooth work. Keyboard, trackpad, and speakers work, with speaker protection in place. Sleep does not work. The display comes up through the boot loader's framebuffer at a fixed resolution, and backlight keys do nothing yet. If you want to try it:

    curl -fsSL https://raw.githubusercontent.com/michaelmonetized/asahi-installer/omnux/scripts/bootstrap-omnux.sh | sh

The desktop runs, but every pixel is drawn on the CPU. That is the part this post is about.

Done means Hyprland rendered by hardware OpenGL and Vulkan, holding 60Hz on battery, behind a display driver that handles modesetting and backlight. Getting there requires reverse engineering, and nobody outside Apple has fully mapped three things on these chips.

How work gets submitted. macOS userspace talks to a firmware coprocessor that manages the GPU. On M1 and M2 the Asahi community mapped its queues and doorbells. M3 changed that protocol. Until someone traces it on real silicon, any driver would be guessing.

What the shaders became. M3 added Dynamic Caching, mesh shaders, and hardware ray tracing. The instruction encoding changed. Dougall Johnson's published ISA research covers much of the new encoding, but the differences still have to be verified against hardware: compile real shaders, capture what the chip does, write down where it diverges.

What the firmware expects. Version negotiation, queue setup, fault reporting against shipping macOS firmware. Every macOS release changes this interface.

All three get solved the same way. Boot an M3 into m1n1's proxyclient harness from a second machine. Run GPU workloads under macOS with instrumentation attached. Diff the captures against what is known about M1 and M2. Write down what changed. Implement from that documentation, clean-room, under an MIT license Asahi can take upstream. Boot the result with kexec. Repeat until benchmarks pass.

Most attempts at this stall because the person writing the driver has no machine to trace. We intend to fix that directly.

Starting today we run an owner program for every M3 model: MacBook Air 13 and 15, MacBook Pro 14 and 16, Mac mini, Mac Studio. We ship you one command called omnux-report that collects how your machine behaves. Verbose logs at every severity, performance benchmarks, full system architecture data. You choose what leaves your machine, serials and keys scrubbed by default. Your reports tell us which models work and which fail, per feature. ADT dumps you volunteer become the device tree data that bring-up depends on. And if you can lend a machine to the trace loop for an afternoon, that helps more than any code written away from hardware.

All of it is now public work with acceptance criteria. Nine engineering blockers in omnux-gpu, eight owner-program issues in the omnux repo, one tracker linking them:

https://github.com/michaelmonetized/omnux/issues/1

I'd like to end with a date and won't. We don't set dates on unfinished reverse engineering, ours included. What I can commit to is that every claim links to a commit, a test result, or a measurement, and regressions get documented in the same repos.

M1 and M2 owners already have all of this working. M3 owners, pick an issue and send us what your machine says.

Per-model status: https://github.com/michaelmonetized/asahi-installer/blob/omnux/SUPPORT.md
