---
title: "Plakar Hackroom Highlights: New Features, Fresh Faces, and Big Ideas 🐿️"
date: 2024-11-13 00:00:00 +0100
authors:
 - "plakup"
categories:
 - technology
tags:
 - plakar
 - backups
---

Hello Plakar pals and curious coders! Plakup here, ready to share all the exciting updates from the past week. Between a new team member, feature-packed improvements, and visionary ideas for Plakar’s future, there’s plenty to talk about. So grab a coffee (or your favorite acorn snack), and let’s dive in!

## 1. Team Updates: Welcome Omar !
We’re thrilled to announce that Omar Polo (@op) joined the team last week! 🎉 With his skills and fresh ideas, we’re excited to see the ways he’ll help Plakar continue to evolve.

## 2. Reviving Features and Streamlining Code 🛠️

### FUSE is Back!
You read that right—Plakar now supports mounting your repository as a filesystem with the `plakar mount` command! This feature makes accessing your snapshots as intuitive as browsing your desktop files. FUSE integration is back and better than ever.

### Snapshot Signing
Your data has never been safer! Plakar now supports snapshot signing, which ensures the integrity and authenticity of your backups. This feature is ready to go, and the CLI will soon be extended to make snapshot signing a breeze.

### Per-Directory Summaries and Error Tracking
Debugging backups just got easier. Plakar now tracks per-directory summaries and errors, offering clear insights into what’s happening in your snapshots.

### S3 Importer Revamp
The S3 importer has been updated to match the new importer interface, following the recent repository refactor. This update ensures smoother functionality and a more flexible architecture moving forward.

### Repository and State Refactor
Gilles undertook a significant effort to simplify the core repository and snapshot state layers. By consolidating duplicate functions and refining the packfile interfaces, the codebase is now more maintainable, efficient, and ready for future improvements. This behind-the-scenes work ensures Plakar is primed for upcoming features and expansions.


## 3. UI Enhancements: Downloads and More! 📥
The Plakar UI is evolving fast! You can now download files directly from the UI with a single click. And that’s just the start—support for downloading multiple files and directories is on the horizon. Julien’s efforts have transformed the UI into an even more user-friendly tool, with much more to come.

## 4. PoC Spotlight: gRPC-Based Plugin System 🔌
Plakar supports three importers—fs, ftp, and s3—but we’re looking ahead to support even more. Julien has been prototyping a gRPC-based plugin system. Here’s the vision:

### The Plugin Architecture
- Standalone Plugins: Importers now run as separate binaries communicating with Plakar via gRPC.
- Cross-Language Support: SDKs like Go (and potentially Python, Java, and more) enable developers to create custom importers in their preferred language.

This approach paves the way for external plugins, allowing users to add new functionality to Plakar easily. It’s a step toward making Plakar as flexible and extensible as possible, while maintaining top-notch performance.

## 5. Closing Thoughts: A Transformative Week 🌟
From welcoming Omar to reviving FUSE, revamping the repository, and experimenting with a gRPC-based plugin system, this has been an incredible week for Plakar. The team is hard at work refining the core, making the UI more powerful, and exploring new ideas for the future.

Until next time, keep your snapshots secure, your plugins polished, and your acorns plentiful! 🐿️

— **Plakup**, your friendly Plakar chipmunk