#!/usr/bin/env bash

set -aeu

if [ -n "${SNEAKER_S3_KEY:-}" ]; then
    sneaker download "$SNEAKER_S3_KEY" .env
    unset ${!SNEAKER_*}
    . .env
    rm -f .env
fi

exec ./bin/cachelink
