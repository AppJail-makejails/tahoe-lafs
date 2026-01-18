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
appjail cmd jexec tahoe-lafs \
    tahoe --help
```

### Arguments

* `tahoe_ajspec` (default: `gh+AppJail-makejails/tahoe-lafs`): Entry point where the `appjail-ajspec(5)` file is located.
* `tahoe_tag` (default: `14.3`): see [#tags](#tags).

### Healthcheckers

* `check_jail`:
  - **description**: Check if the jail is running and restart it if it is not.
  - **options**:
    - `health_cmd`: `host:appjail status -q %j`
    - `recover_cmd`: `host:appjail restart %j`
* `check_pid`:
  - **description**: Check if the PID file exists and the process is still running and restart the jail if it does not.
  - **options**:
    - `health_cmd`: `jail:/healthcheckers/pid_file.sh`
    - `recover_cmd`: `host:appjail restart %j`

## Tags

| Tag           | Arch    | Version            | Type   |
| ------------- | --------| ------------------ | ------ |
| `14.3`    | `amd64` | `14.3-RELEASE` | `thin` |
| `15`    | `amd64` | `15` | `thin` |
