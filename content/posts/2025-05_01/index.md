---
title: "Introducing Plakar v1.0 to redefine Open-Source Data Protection with $3M funding"
date: 2025-05-01 08:00:00 +0100
authors:
- "gilles"
summary: "Immutable, queryable, encrypted snapshots with context and integrity — Kloset redefines how data is stored, verified, and reused..."
categories:
 - technology
 - release notes
featured-scope:
 - hero-page
tags:
 - plakar
 - kloset
 - backups
---

<br />

In February,
[we introduced the first plakar beta release](/articles/2025-02-26/plakar-beta-release/) and since then we worked tirelessly to build our first stable release,
improving on user feedback and adding new nice features while at it.

We're now thrilled to announce the **release of Plakar v1.0.1**, marking a major milestone in our journey:
locking in a stable base that empowers us to experiment, expand, and evolve without compromise, while bringing a ton of exciting new features.

Our goal is to set a new open-source standard, we won't settle for less:

Just like everyone agrees that `git` is a go-to solution for code versioning,
that `docker` is a go-to solution for containers,
or that `k8s` is a go-to solution for orchestration...
we want people to recognize `plakar` as a go-to solution for backups.


--- 
## How are you going to achieve that ?
<div style="display: flex; align-items: flex-start;">
  <img src="monies_small.png" alt="going to the bank" width="200" style="margin-right: 20px;">
  <p>
    To transition from a small project with ideas to a full-fledged business with means,
    Plakar was officially incorporated in September 2024.
    <br />
    <br />
    We’ve since secured a <b>$3 million pre-seed round</b> to fuel our ambitions: assembling the ideal team (which we did.),
    building the most expansive ingestion ecosystem possible, and establishing a new open-source standard.
  </p>
</div>
Our optional enterprise-grade features will provide the long-term financing needed to sustain innovation and growth on this journey.

---
## What is Plakar?

Plakar is a modern, snapshot-based backup and archiving tool designed to simplify data management while ensuring performance, portability, and security.

Its purpose is to eliminate the complexity and rigidity commonly associated with traditional backup solutions.
Plakar achieves this by leveraging an intuitive snapshot model and a custom virtual filesystem (VFS), enabling quick incremental backups and effortless versioning.

The motivation behind creating Plakar stemmed from frustrations with existing backup solutions—often overly complicated, platform-dependent, and inefficient when managing large or frequently updated datasets.

Unlike many traditional tools, Plakar emphasizes simplicity, allowing users to perform backups and restores with minimal friction. Its portable archive format (.ptar) makes transferring and storing snapshots straightforward, while support for diverse storage backends, including local disk, SQLite, SFTP, and more, ensures flexibility.

Additionally, [audited]() built-in encryption provides peace of mind, making Plakar a secure, adaptable, and user-friendly solution for both personal and professional environments.

---
## Why Plakar?

Managing backups and archives often feels like a necessary hassle—existing solutions frequently introduce complexity, require steep learning curves, and perform poorly with large or rapidly changing data sets.

Many tools lack flexibility, restricting users to specific platforms or storage options, and they can fall short when portability matters most. Plakar addresses these challenges head-on: it’s designed from the ground up to be intuitive, performant, and flexible. By offering a simplified snapshot-based backup approach, portable archives, multiple storage backends, and powerful import/export capabilities, Plakar provides an easier and more efficient way to securely manage your valuable data.


Unlike traditional backup solutions, Plakar transforms backups into active, reusable assets—enabling workflows in AI model training, data analytics, compliance audits, and more. Our innovative engine, Kloset, encapsulates backups into compact, portable, and secure units, ensuring data accessibility and rapid recovery across diverse environments.

We're committed to developing an open-source platform that delivers powerful features while remaining intuitive and resource-efficient. Our roadmap includes enhancing interoperability, further performance improvements through advanced deduplication and compression, and extending integrations with various storage environments and platforms.


**FIXME: TEASE what does kloset bring, ie: Plakar SQL `plakar at @st query 012f "SELECT..."` **


---
## Key Features of Plakar v1.0.1

- **Snapshot-Based Backups:**
Quick, incremental, and reliable backups powered by Plakar’s built-in virtual filesystem (VFS). Effortlessly maintain historical versions without redundancy.

- **Portable Archives (.ptar):**
Archive snapshots into a convenient, portable format designed for seamless transfer, reliable storage, and easy restoration across diverse environments.

- **Multiple Storage Backends:**
Flexible support for various storage options, including local disk, SFTP, S3, and more—enabling you to adapt Plakar to your existing infrastructure effortlessly.

- **Powerful Data Integrations:**
Easily import and export snapshots from multiple sources such as FTP/SFTP servers, S3, and others, simplifying data migration and interoperability.

- **Security & Encryption:**
Built-in encryption mechanisms ensure robust data protection, maintaining the confidentiality and integrity of your backups, whether stored locally or remotely.


---
## Technical Highlights

Plakar is designed around a robust snapshot and indexing model, built on top of a custom Virtual File System (VFS) layer. Snapshots represent immutable states of data at specific points in time, efficiently storing incremental changes to minimize redundancy and storage overhead.

Internally, Plakar organizes snapshots into structured components:

- **Packfiles:** Data is efficiently packed into compressed blocks, optimizing storage space and improving performance for data retrieval and transfer.

- **States (Indexes):** A lightweight indexing mechanism maps file structures, versions, and metadata, ensuring rapid snapshot browsing, search, and restoration.

Plakar supports diverse storage backends—local filesystem, SFTP, S3, and more—abstracted through a unified interface. This makes integration straightforward and allows Plakar to seamlessly adapt to various storage environments without sacrificing performance.

Performance optimizations such as incremental indexing, intelligent diffing, and efficient data packing ensure fast snapshot creation and restoration, even with large datasets.
Built-in encryption and integrity checks further guarantee that data remains both secure and reliable.

---
## Getting Started with Plakar

We published a quickstart guide and have a demo available.

Link to official documentation, GitHub repository, and tutorials here.

--- 
## Use Cases & Examples

Plakar excels in several practical scenarios, simplifying common backup and archiving workflows:

- **Developer backups:**  
  Quickly and efficiently create snapshots of your development environments, projects, or code repositories, making recovery straightforward.

- **Database archival and restoration:**  
  Reliably back up SQLite databases with built-in exporters and easily restore them without complex manual procedures.

- **Efficient versioning and diffing of data:**  
  Instantly compare snapshots to manage data changes effectively, track versions, and easily identify specific alterations.

Here are some simple examples demonstrating how Plakar helps solve these common needs:

```sh
# Example: Snapshot your project's source code
$ plakar snapshot create /home/user/myproject
Snapshot created successfully.

# Example: Export and restore an SQLite database snapshot
$ plakar export sqlite mybackup.plkr restored_database.db
Database restored to restored_database.db.
```

--- 

## What's Next for Plakar ?
We're actively working to enhance Plakar with new features and capabilities. Our immediate roadmap includes:

- Additional storage backends (e.g., WebDAV, cloud-based storage).

- Extended support for import/export plugins (more database formats, improved Git integration).

- Enhanced performance and incremental indexing for even faster backups and restores.

- Advanced diffing and snapshot browsing interfaces.

We value community involvement highly and welcome your ideas, feedback, and contributions. Please join us by participating in GitHub issues, discussions, or our community forums.



--- 

## Conclusion

Plakar simplifies backup and archiving through intuitive, snapshot-based management and versatile, portable archives. With built-in encryption, multiple flexible storage options, powerful import/export capabilities, and efficient data handling, Plakar stands out as a practical, robust, and user-friendly backup solution.

Special thanks to all early users, contributors, and supporters who have helped shape this first release—your involvement has been invaluable!

--- 

## Call to Action

Get started with Plakar today and become part of our community:

- [Try Plakar now](link to installation or release page)

- Star on GitHub

- Join the Community (forums, Discord, mailing lists)