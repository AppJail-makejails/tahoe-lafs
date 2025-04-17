# Tahoe-LAFS

Tahoe-LAFS (Tahoe Least-Authority File Store) is the first free software / open-source storage technology that distributes your data across multiple servers. Even if some servers fail or are taken over by an attacker, the entire file store continues to function correctly, preserving your privacy and security.

tahoe-lafs.org

<img src="https://raw.githubusercontent.com/tahoe-lafs/tahoe-lafs/refs/heads/master/docs/_static/media/image2.png" alt="tahoe-lafs logo" width="80%" height="auto">

## How to use this Makejail

```sh
appjail makejail \
    -j tahoe-lafs \
    -f gh+AppJail-makejails/tahoe-lafs \
    -o virtualnet=":<random> default" \
    -o nat
appjail cmd jexec -U tahoe-lafs tahoe-lafs \
    tahoe --help
```

### Arguments

* `tahoe_ajspec` (default: `gh+AppJail-makejails/tahoe-lafs`): Entry point where the `appjail-ajspec(5)` file is located.
* `tahoe_tag` (default: `13.5`): see [#tags](#tags).

## Tags

| Tag           | Arch    | Version            | Type   |
| ------------- | --------| ------------------ | ------ |
| `13.5`    | `amd64` | `13.5-RELEASE` | `thin` |
| `14.2`    | `amd64` | `14.2-RELEASE` | `thin` |
