#!/bin/sh

. /lib.subr

set -e

create_user

export HOME=/noroot

exec su-exec noroot tahoe "$@"
