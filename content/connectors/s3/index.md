---
title: S3 Storage Connector
subtitle: Store your Plakar backups reliably in any S3-compatible object storage
description: Use the S3 storage connector to push your encrypted, deduplicated Plakar backups to AWS, MinIO, or any compatible S3 backend.
categories:
- target
tags:
- s3
- object storage
- cloud backup
- plakar connector
- aws
- minio
date: 2025-04-16
---

## Store Plakar backups in S3-compatible object storage

The **S3 connector** allows you to store Plakar snapshots in any S3-compatible object storage system, such as Amazon S3, MinIO, or Wasabi. This makes it easy to build redundant, cloud-based backup strategies with minimal infrastructure effort.

Whether you’re looking to archive backups off-site, enable disaster recovery, or ensure long-term retention, the S3 connector gives you scalable and cost-effective storage for your Plakar repositories.

## Quick Start – Using S3 as a backup target

### 1. Create a repository configuration for your S3 bucket

Use `plakar config` to declare the target:

```bash
$ plakar config repository create mycloud
$ plakar config repository set mycloud location s3://s3.amazonaws.com/mybucket
$ plakar config repository set mycloud access_key YOUR_ACCESS_KEY
$ plakar config repository set mycloud secret_access_key YOUR_SECRET_KEY
$ plakar config repository set mycloud passphrase ****************
```

For MinIO or self-hosted backends:

```bash
$ plakar config repository set mycloud location s3://minio.plakar.io:9001/mybucket
```

You can now create the repository:

```bash
$ plakar at @mycloud create
```

2. Push backups to your S3-backed repository
Once the remote repository is configured, you can use it directly for backups:

```bash
$ plakar at @mycloud backup /var/www
```

Or you can synchronize snapshots from a local repository:

```bash
$ plakar at /var/plakar sync to @mycloud
```

This avoids re-reading the original source and ensures consistency.

3. Browse and restore from the S3 repository
List available snapshots:

```bash
$ plakar at @mycloud ls
```

Restore a snapshot:

```bash
$ plakar at @mycloud restore -to /tmp/restore abc123:/var/www
```

Why use S3 as a storage target?
- ☁️ Scalable: Object storage can grow with your backup needs.
- 💸 Cost-efficient: Use cold storage tiers for archival workloads.
- 🔐 Secure: Encrypted end-to-end by Plakar, even before leaving your system.
- 🌍 Redundant: Backed by cloud availability zones or on-prem object storage.
- 🔁 Compatible: Works with AWS, MinIO, Wasabi, Scaleway, Ceph, and more.

Notes
The repository is fully encrypted. Even cloud operators cannot read your data without the passphrase.
Snapshots are deduplicated and compressed before upload to reduce costs.
Synchronization can be used to batch uploads from edge systems to central storage.