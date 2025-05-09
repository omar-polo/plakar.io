---
title: S3
subtitle: Protect your S3 buckets from rogue deletion, ransomware, and silent corruption.
description: Use the Plakar S3 integration to back up, restore, or replicate your object storage buckets from any S3-compatible service.
technology_description: S3 is a scalable object storage service commonly used for data archiving, backup, analytics, and cloud-native applications. It is accessible via a RESTful API and widely supported across public cloud providers and self-hosted solutions.
categories: 
  - integration
tags:
  - s3
  - object storage
  - aws
  - minio
  - ceph rgw
  - scality
  - wasabi
stage:
  - stable
date: 2025-04-17
---

## What is S3?

S3 (Simple Storage Service) is a highly available and durable object storage service used to store arbitrary data as discrete objects in buckets. S3 is offered by AWS, and compatible implementations are available via software such as MinIO, Ceph RGW, Wasabi, and Scality Zenko. It is ideal for storing backups, media archives, logs, and large data sets.

With Plakar, you can ingest data from S3 buckets into immutable, encrypted snapshots that are verifiable and portable. You can also use S3 as a target repository to store backups created from any source.



## Quick Start: Backup Your S3 Bucket

To back up an S3 bucket using Plakar:

```bash
$ plakar config repository create s3
# For AWS:
$ plakar config repository set s3 location s3://s3.<region>.amazonaws.com/<bucket>
$ plakar config repository set s3 passphrase ****************
$ plakar config repository set s3 access_key <ACCESS_KEY>
$ plakar config repository set s3 secret_access_key <SECRET_KEY>

$ plakar at @s3 create

# Backup a local path to your S3 repository
$ plakar at /var/backups sync to @s3
````


## Configuration

Plakar uses a declarative configuration system to define remote repositories.

### Minimum Configuration for S3:

- `location`: the full S3 URL (e.g., `s3://minio.plakar.io:9000/mybucket`)
- `access_key`: your S3 access key
- `secret_access_key`: your S3 secret key
- `passphrase`: encryption key used to protect the repository

You can configure the repository using commands:

```bash
$ plakar config repository create s3
$ plakar config repository set s3 location s3://<endpoint>/<bucket>
$ plakar config repository set s3 access_key <ACCESS_KEY>
$ plakar config repository set s3 secret_access_key <SECRET_KEY>
$ plakar config repository set s3 passphrase <PASSPHRASE>
```

## Supported Features

- ✅ Immutable, encrypted backups to S3
- ✅ Incremental and deduplicated uploads
- ✅ Integrity check and cryptographic audit
- ✅ Efficient synchronization between repositories
- ✅ Partial and granular restore from snapshots
- ✅ Support for AWS S3 and S3-compatible providers (MinIO, Wasabi, Ceph, etc.)
- ✅ Fully stateless CLI and UI support


## Limitations

- No native listing or browsing of object contents from remote S3 buckets (must first snapshot or sync).
- Snapshots stored in S3 cannot be modified — only added or deleted entirely.
- Object versioning at the S3 level is not leveraged (handled internally by Plakar).


## Future Improvements

- Support for multi-region replication policies
- Native diff inspection between remote buckets
- Restore directly to S3 objects (re-export snapshot to bucket)


## Screenshots



## Threats

- **Rogue deletion**: accidental or malicious deletion of objects by users or applications.
- **Ransomware**: encryption of S3 bucket content by compromised credentials.
- **Silent corruption**: unnoticed object corruption or bit rot without versioning or verification.
- **Credential leakage**: compromised access keys or shared secrets allowing full access.

Using Plakar with S3 mitigates these risks by storing encrypted, immutable, and verifiable backups that can be inspected and restored safely.

