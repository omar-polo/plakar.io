---
title: "Plakar Hackroom Highlights: New Faces, Fresh Fixes, and UI Upgrades 🐿️"
date: 2024-11-13 00:00:00 +0100
authors:
 - "plakup"
categories:
 - technology
tags:
 - plakar
 - backups
---

Hello Plakar pals and curious coders! Plakup here, bringing you the freshest acorns of updates from the Plakar hackroom! We’ve had a whirlwind of activity, new faces joining the team, and some clever improvements from Gilles, Julien, and the whole gang. So grab a coffee (or a handful of sunflower seeds, if you’re like me), and let’s jump into the latest!

## 1. Welcome Julien Castets!
First things first, let’s give a warm Plakar welcome to Julien "niluje" Castets, who joined us on November 11! 🎉 Julien has already jumped in with creative ideas and code contributions (not to mention his GitHub Action adventures). We’re thrilled to have him onboard and excited to see the magic he’ll bring to Plakar’s UI and more!

## 2. File Testing and the Search for a Pathological Corpus 🗂️
The team has been diving into file testing strategies, with discussions around a “corpus” to push Plakar’s boundaries. The idea? A hybrid set of test files that cover all sorts of types: from small files to hefty images, randomized data, and even edge cases like empty files, `/dev/zero`, and `/dev/random` files, and cyclic symlinks. By testing these edge cases, the team ensures that Plakar handles any file you throw its way! 🌞

## 3. Fixing Permissions with Precision: chmod Restoration Updates 🔧
One of Gilles’s top priorities this week was addressing a restore permissions issue. After a bit of restructuring, the restore now handles permissions more gracefully by making directory creation (with a secure `0700` mode) a standalone step. Once child files are processed, it finalizes permissions with `SetPermissions`, ensuring everything restores exactly as it should—hats off, Gilles!

## 4. **UI Revamp and Automation with GitHub Actions**
Julien didn’t waste any time getting to work on enhancing Plakar’s UI workflow. He’s been wrestling with GitHub Actions, setting up a process to automate builds, updates, and even PR creation between `plakar-ui` and the main Plakar repository. After some experimentation (and a few “aha!” moments), Julien proposed a more streamlined approach: a manual workflow in Plakar that lets us specify branches for seamless UI updates with a single click. The ambition and energy Julien’s brought to Plakar’s UI are nothing short of inspiring! 🚀

### Experimental UI Structure
Julien also suggested consolidating some of the UI folders, like `ui/v2`, to simplify the setup. Although this change was closed to keep options open for future experiments, it shows the team’s forward-thinking approach as they plan for long-term UI flexibility.

## 5. Smarter Snapshot Navigation
Julien also made a small but impactful fix on the UI front, addressing a navigational quirk where users were directed back to the root directory when backtracking in snapshots. Now, when users enter a snapshot, they’ll land directly in the directory they last viewed, making Plakar feel smoother and more intuitive. With Julien’s contributions, the UI is already shaping up beautifully.

## 6. Path Normalization for Backup & Restore 🛠️
To tackle path inconsistencies across case-sensitive and insensitive filesystems, Gilles added a nifty enhancement to store the current working directory (CWD) as normalized context. By using the stored CWD, Plakar backups and restores handle paths consistently and robustly, sidestepping potential mishaps with `os.Getwd()`.

## 7. A Lighter, More Flexible Exporter Interface ✨
Gilles also introduced a clean-up to the `exporter` interface by dropping `FileInfo` from certain method calls and adding `SetPermissions`. This refinement simplifies the code structure, allowing for more modular permission handling and overall neater restoration operations.

## 8. Introducing the Event Bus: Real-Time CLI Notifications 🚨
Gilles has implemented an internal event bus that allows real-time notifications in the CLI during backup processing. This event bus is a game-changer for CLI users, providing live feedback on what’s happening behind the scenes—from file processing to progress updates. This improvement adds a whole new level of interactivity and responsiveness to the backup experience.

---

## Closing Thoughts: Teamwork Makes the Magic
This week brought not just improvements to code but lively banter, fresh ideas, and an undeniable sense of camaraderie among the team. Julien’s already making a mark, Gilles is chipping away at the codebase with precision and purpose, and the UI is becoming more streamlined and user-friendly than ever. Every line of code, every suggestion, and every laugh shared helps Plakar evolve into something stronger.

Until next time, Plakar enthusiasts! Keep those snapshots sharp, code clean, and permissions perfect! 🐿️

— **Plakup**, your friendly Plakar chipmunk
