---
title: SFTP
subtitle: Securely back up remote servers over SFTP with Plakar
description: Host your kloset on a remote server over the SFTP protocol.
categories:
- storage connectors
stage: stable
tags:
- SFTP
- Linux
- BSD
- NAS
- Synology
- Qnap
date: 2025-05-13
---

# SFTP Integration

## Overview

The **Plakar SFTP storage connector** enables creation of a [Kloset store](/posts/2025-04-29/kloset-the-immutable-data-store/) on remote filesystems over SSH.

## Configuration

The SFTP storage connector does not require any special configuration and you can use it directly with the `plakar` command. However, setting up a source configuration can make things more convenient, and allows to specify additional options like ignoring host key verification or specifying an identity file.

### Setting Up a source configuration

You can configure a source configuration `mysftp`:

```
$ plakar config repository create mysftp
$ plakar config repository set mysftp location sftp://<IP_address_or_hostname>/<path>
```

To refer to this remote in Plakar commands, use the syntax `@mysftp`, for example `plakar at @mysftp ls`.

#### Storage Configuration Options

- **`location`**: SFTP URL. Format: `sftp://<endpoint>/<optional_path>`. To specify the username, port or identity file path, use the SSH configuration file `~/.ssh/config`.
- `insecure_ignore_host_key`: Ignore host key verification (default: false).
- `identity_file`: Path to the SSH identity file. By default, Plakar reads the file `~/.ssh/config` for the identity file. If not present, it falls back to the default SSH identity files `~/.ssh/id_rsa`, `~/.ssh/id_ed25519`, `~/.ssh/id_ecdsa` and `~/.ssh/id_dsa`.


## Example Usage

Let's assume we want to create a Kloset store to the remote server with the IP address `1.2.3.4`, and we want to back up the `/etc` directory to this Kloset store.

First, create the SSH configuration file `~/.ssh/config` with the following content:

```
Host myserver
  HostName 1.2.3.4
  User root
  Port 22
  IdentityFile ~/.ssh/id_rsa
```

Ensure your public key is added to the remote server's `~/.ssh/authorized_keys` file for the user you specified, and make sure you can connect to the server using SSH:

```bash
ssh myserver
```

Now, let's configure the SFTP repository in Plakar:

```
$ plakar config repository create mysftp
$ plakar config repository set mysftp location sftp://myserver/var/backups
```

If it's not already done, start the agent:

```bash
$ plakar agent start
```

Create a Kloset repository at `/var/backups`:

```
$ plakar at @mysftp create
```

Finally, let's backup the `/etc` directory to the Kloset repository and list the contents of the Kloset store:

```
$ plakar at @mysftp backup /etc
$ plakar at @mysftp ls
```

## Questions, Feedback, and Support

Found a bug? [Open an issue on GitHub](https://github.com/PlakarKorp/plakar/issues/new?title=Bug%20report%20on%20SFTP%20integration&body=Please%20provide%20a%20detailed%20description%20of%20the%20issue.%0A%0A**Plakar%20version**)

Join our [Discord community](https://discord.gg/uuegtnF2Q5) for real-time help and discussions.

## Q&A

**How can I configure the username, port or identity file for my SFTP server?**

You can set these options in the SSH configuration file `~/.ssh/config`. For example:

```
Host myserver
  HostName example.com
  User myuser
  Port 2222
  IdentityFile ~/.ssh/my_id_rsa
```

**How can I prevent Plakar from prompting for my SSH passphrase?**

You can use your local ssh-agent(1) to memoize the passphrase. Plakar will try
to connect to the ssh-agent socket at $SSH_AUTH_SOCK.
