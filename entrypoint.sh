#!/usr/bin/env bash

set -aeu

if [ -n "${SNEAKER_S3_KEY:-}" ]; then
  aws configure set default.s3.signature_version s3v4
  aws s3 cp s3://$SNEAKER_S3_KEY ./env.tar.enc
  sneaker unpack env.tar.enc env.tar
  tar -xvf env.tar
  unset ${!SNEAKER_*}
  . .env
  rm -f .env
fi

exec ./bin/cachelink
