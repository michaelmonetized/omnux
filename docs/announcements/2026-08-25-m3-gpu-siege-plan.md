# Omarchy on M3, 4, 5, 6+ Apple Silicon.

An M3 Mac can run Omarchy today...

```bash
curl -fsSL https://raw.githubusercontent.com/michaelmonetized/asahi-installer/omnux/scripts/bootstrap-omnux.sh | sh
```

...software rendered.

NO GPU support.

We need testers, and test boxes who aren't afraid to share complete telemetry, traces, ADT dumps back to agents to grind and progress to reverse engineer GPU drivers for 3, 4, 5, and now 6 series Apple Silicon chips.

We want the community filing issues, PRs, sharing logs and traces.

So we built an app to collect relevant information transparently and securely into our Omarchy installer and resulting OS. omnux-report.

https://github.com/michaelmonetized/omnux-report

It's fully open source, free to use, fork, and contribute.

If you have an M1 or M2 apple device you're in luck, there is full and complete hardware support. No sleep, no TouchId.

Follow this step by step https://github.com/maralcbr/omarchy-mx-mac

---
*Draft notes (not for posting): pending accuracy fixes flagged in review —
title overclaims 4/5/6 support vs installer gate; M1/M2 sleep works
(s2idle); "full and complete" contradicts WIP rows (TB, DP alt mode,
TouchID). Sources: SUPPORT.md, asahilinux.org feature-support pages.*
