# STEERING — how Omnux decides

Non-negotiables. Changes to this file require the project lead.

## 1. Truth is a feature

The truth table is sacred. We ship honest status per machine and per
subsystem. No roadmap-speak, no "coming soon" without a named blocker.
If marketing pressure and the truth table conflict, the truth table wins.

## 2. Upstream first, always

Asahi Linux did the science; we do the shipping. Every patch we carry gets
offered upstream before or alongside landing in an `omnux` branch. Our forks
exist to compress time-to-user for work that exists but hasn't merged — not
to diverge.

## 3. Integration is our superpower; fabrication is our poison

We merge public enablement work within days of it existing. We never write
code that pretends hardware works when it doesn't. Driver code without a
hardware validation loop does not get called "working," internally or
publicly.

## 4. Local CI. Own metal.

Builds and releases run on maintainer machines via scripts in this repo
(see installer's `build-local.sh`). No hosted CI gatekeepers. When volume
demands it: Blacksmith runners under the org — still ours, still scriptable,
still not GitHub Actions.

## 5. MIT where we wrote it

Original Omnux code is MIT (see omnux-gpu). We respect and carry upstream
licenses where integration requires GPL etc. Everything we author free and
clear goes to the world, upstream included.

## 6. The user owns their machine

The installer warns loudly before anything risky (experimental tracks require
typed consent), never touches macOS data beyond what partitioning demands,
and always documents the recovery path. Convenience never overrides consent.

## 7. Small surfaces, deep work

Components stay focused (kernel / boot / installer / packages / gpu). The
monorepo coordinates; it doesn't absorb. Docs live here; code lives where its
community already looks for it.

## 8. Fire, with receipts

The voice of this project is bold because the engineering is real. Every bold
claim links to evidence: releases, commits, test results. Passion plus proof.
