#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dd03dac6d59d0001b485ca6/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dd03dac6d59d0001b485ca6
curl -s -X POST https://api.stackbit.com/project/5dd03dac6d59d0001b485ca6/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dd03dac6d59d0001b485ca6/webhook/build/publish > /dev/null
