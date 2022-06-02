#!/usr/bin/env bash

set -e

if ["$1" = 'deploy']; then
  /code/scripts/zeek_create_configs.py
  zeekctl deploy

fi

exec "$@"
