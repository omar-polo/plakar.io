---
title: Filesystem
subtitle: Protect your local files and folders with immutable, encrypted, verifiable backups
description: Use the Filesystem integration to back up and restore directories from local or mounted filesystems with full integrity and metadata preservation.
technology_description: A filesystem is the foundational structure that manages how data is stored and retrieved on storage media such as hard drives, SSDs, or network volumes.
categories: 
- integration
tags:
- filesystem
- local backup
- nfs
- samba
- nas
- san
- ntfs
- ext4
stage: stable
date: 2025-05-05
---

## What is a filesystem?

A **filesystem** organizes and stores data on a storage device in a hierarchical structure of files and directories. It handles operations such as reading, writing, access control, timestamps, and permissions. Local filesystems (e.g., ext4, APFS, NTFS) and mounted remote filesystems (e.g., NFS, SMB) are the foundation of most systems and are critical to safeguard.

Plakar leverages its **immutable snapshot engine** to perform consistent, secure, and encrypted backups of filesystem trees. The Filesystem integration transforms the scanned directory structure into a verifiable virtual snapshot that can be restored anywhere, in part or in full.

## Quickstart: Backup a local directory

### 1. Create a repository on your local filesystem

This creates a local encrypted repository in `/var/backups`:

```bash
plakar at /var/backups create
repository passphrase: *****
repository passphrase (confirm): *****
``` 

If you prefer an unencrypted repository (not recommended unless purely local):

```bash
plakar at /var/backups create -no-encryption
```

### 2. Backup a directory from your filesystem

This backs up `/etc` and creates a new snapshot:

```bash
plakar at /var/backups backup /etc
```

You can tag snapshots to identify them more easily:

```bash
plakar at /var/backups backup -tag system-config /etc
```

### 3. List your backups

```bash
plakar at /var/backups ls
```

### 4. Restore a backup

Restore the `/etc` snapshot to `/tmp/restore`:

```bash
plakar at /var/backups restore -to /tmp/restore snapshotID:/etc
```

You can restore only part of a snapshot, and even rebase the structure:

```bash
plakar at /var/backups restore -rebase -to /tmp/etc snapshotID:/etc
```

## Supported features

- Full POSIX metadata preservation (permissions, timestamps, ownership)
- Deduplicated, compressed, encrypted backups
- Snapshot tagging and filtering
- Partial restore (single file, subtree)
- File exclusion patterns (`-exclude`, `-excludes`)
- Efficient incremental backups
- Cryptographic integrity verification
- Snapshot browsing (CLI and Web UI)

## Limitations

- Does not currently support filesystem special types like device nodes or sockets
- Backup of symlinks is supported, but symlink targets are not followed by default

## Future improvements

- Detection and deduplication of hard links
- Dry-run support for planned restores
- Inclusion of ACL and extended attribute support

## Screenshots


## Threats

- Ransomware or malicious deletion of source files before backup
- Human error during restore (e.g. overwriting live system files)
- Loss of encryption passphrase (makes repository irrecoverable)
- Local disk corruption if repository is stored on same drive as source


