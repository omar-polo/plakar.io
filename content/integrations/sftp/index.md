---
title: SFTP
subtitle: Securely back up remote servers over SFTP with Plakar
description: Backup your remote directories using the Plakar SFTP connector. Perform versioned, encrypted, and deduplicated backups over the secure SFTP protocol.
categories:
- storage connector
stage: beta
tags:
- sftp
- linux
- bsd
- nas
- synology
- qnap

date: 2025-04-16
---

## Back up remote directories with Plakar over SFTP

The **SFTP connector** allows Plakar to perform secure, encrypted backups of remote files and directories over the SSH File Transfer Protocol (SFTP). This is especially useful for backing up critical infrastructure servers, VPS instances, or remote NAS devices.

Plakar treats an SFTP path as a valid source directory, backing up its contents into any configured Plakar repository. It ensures full snapshot creation, deduplication, and encryption, just as it would for local directories.

Whether you're backing up a production web server, a remote dev box, or a critical configuration store on your NAS, the SFTP source connector gives you full control and flexibility.

## Usage – Backing up a remote SFTP server

### 1. Create or select a Plakar repository

If you haven’t already created a local Plakar repository, do so:

```bash
$ plakar at /var/plakar create
```

Or reuse an existing one.

### 2. Perform a backup over SFTP
To back up the /etc directory from a remote machine:

```bash
$ plakar at /var/plakar backup sftp://user@remote-host/etc
```
You can also tag the snapshot for easier retrieval:

```bash
$ plakar at /var/plakar backup -tag remote-etc sftp://user@remote-host/etc
```
Plakar will prompt for the SSH password or use your SSH key automatically (via your SSH agent if available).

### 3. Verify the backup was successful
List the snapshots in the repository:

```bash
### $ plakar at /var/plakar ls
```
You should see the newly created snapshot with its associated path and size.

### 4. Restore data later if needed
Use the snapshot ID to restore content from the SFTP backup:

```bash
$ plakar at /var/plakar restore -to /tmp/restore abc123:/etc
```

Replace abc123 with the actual snapshot ID shown from the ls output.

## Benefits of using SFTP as a data source
- 🔐 Secure: Data travels over encrypted SSH connections.
- 🚫 Agentless: No need to install anything on the remote server.
- 💾 Efficient: Plakar uses deduplication and compression to reduce bandwidth and storage needs.
- 🔁 Flexible: Works with any standard sftp-server, whether on Linux servers, NAS devices, or cloud VMs.

## Requirements
- The remote server must support SFTP (via OpenSSH).
- Ensure the remote path is absolute (/etc, not etc).
- Password authentication or SSH key authentication must be properly configured.
