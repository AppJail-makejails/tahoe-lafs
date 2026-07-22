# tahoe-lafs

Tahoe-LAFS (Tahoe Least-Authority File Store) is the first free software / open-source storage technology that distributes your data across multiple servers. Even if some servers fail or are taken over by an attacker, the entire file store continues to function correctly, preserving your privacy and security.

wikipedia.org/wiki/Tahoe-LAFS

<img src="https://raw.githubusercontent.com/tahoe-lafs/tahoe-lafs/refs/heads/master/docs/_static/media/image2.png" width="30%" height="auto" alt="tahoe-lafs logo">

## How to use this Makejail

```console
$ appjail oci run \
    -o overwrite=force \
    -o virtualnet=":<random> default" \
    -o nat \
    -o ephemeral \
    ghcr.io/appjail-makejails/tahoe-lafs tahoe-lafs \
    --help &&
  appjail stop tahoe-lafs
```

### Arguments (stage: build)

* `tahoe-lafs_from` (default: `ghcr.io/appjail-makejails/tahoe-lafs`): Location of OCI image. See also [OCI Configuration](#oci-configuration).
* `tahoe-lafs_tag` (default: `latest`): OCI image tag. See also [OCI Configuration](#oci-configuration).

### Environment (OCI image)

* `PGID` (default: `1000`): Equivalent to `PUID` but for the Process Group ID.
* `PUID` (default: `1000`): Process User ID for the container's main process, allowing you to match the owner of files written to mounted host volumes to your host system's user. Writable volumes are changed based on this environment variable.

## OCI Configuration

```yaml
build:
  variants:
    - tag: 15.1
      containerfile: Containerfile
      aliases: ["latest"]
      default: true
      args:
        FREEBSD_RELEASE: "15.1"
        PYVER: "312"
        NO_PKGCLEAN: "1"
      cache_dirs: ["pkgcache0:/var/cache/pkg"]
```
