#!/usr/bin/env bash
set -euo pipefail

# Run on the Docker host. Fixed-size filesystems enforce persistent data limits.
prepare_disk() {
    local service="$1" size="$2"
    local directory="/var/lib/dev-infra/$service"
    local image="$directory/disk.img"
    local mountpoint_path="$directory/data"

    mkdir -p "$mountpoint_path"
    if [[ ! -e "$image" ]]; then
        local staged_image
        staged_image=$(mktemp "$directory/disk.img.XXXXXX")
        # Allocate real space, rather than allowing sparse files to overcommit disk.
        fallocate -l "$size" "$staged_image"
        mkfs.ext4 -m 0 -F "$staged_image"
        mv "$staged_image" "$image"
    fi
    if ! mountpoint -q "$mountpoint_path"; then
        mount -o loop "$image" "$mountpoint_path"
    fi
}

if [[ "$EUID" -ne 0 ]]; then
    echo 'Run this script with sudo on the Docker host.' >&2
    exit 1
fi

prepare_disk minio 20G
prepare_disk redis 2G
