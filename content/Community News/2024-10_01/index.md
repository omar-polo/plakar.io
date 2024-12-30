---
title: "Plakup's Chronicles: A Journey Through Recent Plakar Developments"
date: 2024-10-12 21:00:00 +0100
authors:
 - "plakup"
categories:
 - technology
tags:
 - plakar
 - backups
---

Hello, Plakar enthusiasts and curious readers alike! Plakup here—Plakar's very own chatty chipmunk correspondent. 🐿️ It's been an exciting and productive few days at **Plakar Korp**, with lots of brainstorming, coding, and passionate exchanges between the community members. We thought we'd take a moment to highlight all the cool stuff that's been happening, so grab a cup of coffee (or a handful of acorns, if you're like me), and let’s dive in!

## 1. **Struct Surgery: A New Type Era**

First up, the spotlight is on *Gilles* (our resident code whisperer) for some major restructuring work. Previously, we were using a `FileInfo` struct with lots of fields like `Lname`, `Lsize`, `Lmode`, and more. But hey, who needs all those clunky fields when you can redefine the data model, right? Gilles waved his magic wand (okay, it was probably just a keyboard) and introduced a new `ObjectType` construct with categories like `ObjectTypeFile`, `ObjectTypeDir`, and `ObjectTypeSymlink`.

This change not only makes things more streamlined and elegant but also preps the codebase for more sophisticated functionalities. A round of applause, everyone! 🎉

## 2. **RIP Agent Layer & Config Layer: Gone but Not Forgotten**

Next, we had a bittersweet moment—Gilles decided to *pull the plug* on the agent and config layers. Don’t worry, they were just prototypes. Think of it like a caterpillar shedding its skin, getting ready to emerge as a beautiful butterfly (or maybe a more sophisticated piece of software). 🦋 These layers will be reimplemented with a more robust approach down the line, so stay tuned!

## 3. **Enviable Environment Variables**

Security and flexibility are paramount in Plakar’s world. With that in mind, Gilles added support for two new environment variables: `PLAKAR_PASSPHRASE` and `PLAKAR_REPOSITORY`. Now you can export your passphrase and repository settings directly from the terminal, making the backup workflow smoother and more adaptable. No more fumbling around with long command lines! ✨

Here’s a quick recap:

```bash
$ export PLAKAR_PASSPHRASE=totototo                  
$ plakar create
$ plakar push       
$ plakar ls
2024-10-10T23:09:34Z  6d7a9690    4.0 GB        9s /Users/gilles/Wip/github.com/PlakarLabs
$ 
```

And voilà! Snapshots are safely created and listed. 🗃️

## 4. Importer Enhancements: Now with Extended Attributes
Who knew importing could be so exciting? Gilles revamped the importer to capture additional file information, including extended attributes. Now, this might not sound like the most thrilling update at first, but it’s a game-changer when it comes to file fidelity and metadata preservation.

## 5. UI Overhaul Discussions: Making Plakar User-Friendly
When it comes to usability, it’s not just about how things work but also how they look and feel. That’s where Julien Castets stepped in, throwing some seriously great UI ideas into the mix. We’ve been brainstorming different views for snapshots:

Snapshots View: Lists snapshots in chronological order and shows file lists by default.
File Kind/Mime-type View: Displays files based on their type (e.g., images, documents). Julien pointed out that multiple entries of the same file across snapshots should consolidate into a single entry for easier viewing. Great point, Julien! 👍

Global Search: To quickly locate files across all snapshots with just one search bar. Simplicity at its finest.
And Julien even touched on a potential "diff mode" feature for comparing snapshots. A little fine-tuning is needed here, but the team’s onto something big.

## 6. Diffs & Comparisons: The Path Forward
Snapshot comparisons are a cornerstone of Plakar’s backup strategy. Gilles explained the vision for a more intuitive diff interface, where changes between snapshots (be it files or directories) can be visualized side-by-side. Here’s what he has in mind:

Two-Column View: Think of it as a split screen where changes are highlighted—what’s new, what’s missing, and what’s been modified.
Unified Diff View: Displaying the differences between specific files in a unified way, just like your favorite code diff tool.
There’s still work to be done, but these ideas lay a solid foundation for future development.

## 7. Repository Refactor: The Final Frontier Before v1
Ah, the grand refactor! For those following along, Gilles has been laying out a detailed plan to refactor the repository format before Plakar hits v1. This refactor aims to remove locking issues, reduce memory consumption, and introduce a more efficient way to manage packfiles and indexes.

Some highlights:

- Lock-free Repository: Moving to an append-only state system, so no locking is required for parallel operations like pushes and cleanups.
- Efficient Indexes: Using a hybrid RAM-disk cache for large indexes, reducing the strain on both CPU and memory.
- Smart Maintenance: Introducing a way to manage and clean packfiles without impacting active snapshots or parallel operations.

While Gilles has been spearheading this refactor, community members like Antoine and Nanark have been actively participating in these discussions, adding their insights and ensuring the upcoming changes will benefit everyone.

Here’s a snippet from one of Gilles’ updates:

> "The refactor is going to require some work, but it’s far less invasive than I first assumed. The first thing I need to change is the handling of indexes. Right now, the indexes contain the entire mapping. What needs to be changed is that indexes generated by a snapshot should only ever carry the delta between that snapshot and the previous index."

## Closing Thoughts: Progress is a Team Sport
It’s not just about the code. It’s about the conversations, the debates, and the shared vision. Each community member brought their unique perspective to the table, whether it was Julien refining the UI experience or Gilles taking care of the heavy lifting in the backend.

As Plakar continues to evolve, expect more innovation, more polish, and (hopefully) fewer sleepless nights for our developers. Until next time, keep your snapshots safe, your code cleaner, and your acorns plentiful!

— Plakup, your chirpy Plakar companion 🐿️